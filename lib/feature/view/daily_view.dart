import 'package:agenda_app_with_flutter/core/components/text_form_field_validator.dart';
import 'package:agenda_app_with_flutter/feature/model/daily.dart';
import 'package:agenda_app_with_flutter/feature/viewmodel/daily_view_model.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:agenda_app_with_flutter/product/theme/dark_theme.dart';
import 'package:agenda_app_with_flutter/product/widget/daily_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyView extends StatelessWidget with ProjectConstants, ProjectPaddings {
  DailyView({Key? key}) : super(key: key);

  TextEditingController addDescriptionController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _dailyViewAppBar(context),
      body: ListView.builder(
        itemCount: context.watch<DailyViewModel>().dailies?.length ?? 0,
        itemBuilder: (context, index) {
          Daily daily = context.read<DailyViewModel>().dailies![index];
          return Dismissible(
            key: Key(daily.id ?? ''),
            child: DailyItem(
              daily: daily,
            ),
            onDismissed: (direction) {
              context.read<DailyViewModel>().delete(daily);
              context.read<DailyViewModel>().getCacheDatas();
            },
          );
        },
      ),
    );
  }

  AppBar _dailyViewAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        notes,
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
      height: MediaQuery.of(context).size.height / 2.8 +
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
                controller: addDescriptionController,
                decoration: InputDecoration(
                  label: Text(descriptionLabel),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding20),
              child: ElevatedButton(
                onPressed: () {
                  if (addDescriptionController.text.isNotEmpty) {
                    context.read<DailyViewModel>().add(
                          Daily.create(
                            description: addDescriptionController.text,
                            createdTime: DateTime.now(),
                          ),
                        );
                    context.read<DailyViewModel>().getCacheDatas();
                    addDescriptionController.text = nullText;
                    Navigator.pop(context);
                  }
                },
                child: Text(bottomSheetSaveButton),
              ),
            )
          ],
        ),
      ),
    );
  }
}
