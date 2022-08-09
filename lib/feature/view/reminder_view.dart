import 'package:agenda_app_with_flutter/core/components/text_form_field_validator.dart';
import 'package:agenda_app_with_flutter/feature/model/reminder.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/reminder_view_model.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:provider/provider.dart';

class ReminderView extends StatelessWidget with ProjectConstants, ProjectPaddings {
  ReminderView({Key? key}) : super(key: key);

  TextEditingController reminderTextController = TextEditingController();

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _reminderViewAppBar(context),
      body: ListView.builder(
        itemCount: context.watch<ReminderViewModel>().reminders?.length ?? 0,
        itemBuilder: (context, index) {
          Reminder reminder = context.read<ReminderViewModel>().reminders![index];
          return Dismissible(
            key: Key(reminder.id.toString()),
            child: ListTile(
              title: Text(reminder.description),
              subtitle: Text(
                  '${reminder.createdTime!.day}.${reminder.createdTime!.month}.${reminder.createdTime!.year} ${reminder.createdTime!.hour}:${reminder.createdTime!.minute}'),
              trailing: Text(
                  '${reminder.alarmTime.day}.${reminder.alarmTime.month}.${reminder.alarmTime.year} ${reminder.alarmTime.hour}:${reminder.alarmTime.minute}'),
            ),
            onDismissed: (direction) {
              context.read<ReminderViewModel>().deleteReminder(reminder);
              context.read<ReminderViewModel>().getCacheDatas();
            },
          );
        },
      ),
    );
  }

  AppBar _reminderViewAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        reminder,
        style: DarkTheme().darkTheme.textTheme.headline5,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(padding20))),
              context: context,
              builder: (context) {
                return _dailyAddBottomSheetItem(context);
              },
            );
          },
        ),
      ],
    );
  }

  SizedBox _dailyAddBottomSheetItem(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.2 +
          MediaQuery.of(context).viewInsets.bottom,
      child: Form(
        key: _globalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding20),
              child: TextFormField(
                validator: TextFormFielValidator().isNotEmpty,
                maxLines: 5,
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: reminderTextController,
                decoration: InputDecoration(
                  label: Text(reminderLabel),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding20),
              child: Row(
                children: [
                  Text(reminderBottomSheetLabel),
                  const Spacer(),
                  OutlinedButton(
                    child: Text(context.watch<ReminderViewModel>().date.toString()),
                    onPressed: () async {
                      DateTime? chosenTime = await showOmniDateTimePicker(
                          context: context, is24HourMode: true);
                      if (chosenTime != null) {
                        context.read<ReminderViewModel>().changeDate(chosenTime);
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding20),
              child: ElevatedButton(
                child: Text(bottomSheetSaveButton),
                onPressed: () {
                  if (reminderTextController.text.isNotEmpty) {
                    context.read<ReminderViewModel>().addReminder(
                          Reminder.create(
                            description: reminderTextController.text,
                            alarmTime: context.read<ReminderViewModel>().date,
                          ),
                        );
                    context.read<ReminderViewModel>().getCacheDatas();
                    context.read<ReminderViewModel>().startScheduledNotification();
                    reminderTextController.text = nullText;
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
