import 'package:agenda_app_with_flutter/feature/viewmodel/navbar_view_model.dart';
import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';
import 'package:agenda_app_with_flutter/product/constants/project_paddings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavbarView extends StatefulWidget {
  NavbarView({Key? key}) : super(key: key);

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView>
    with TickerProviderStateMixin, ProjectConstants, ProjectPaddings {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavbarViewModel>(
      create: (context) => NavbarViewModel(),
      builder: ((context, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.watch<NavbarViewModel>().currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: agenda,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.pie_chart),
                label: expenses,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.note_alt),
                label: notes,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.alarm),
                label: reminder,
              ),
            ],
            onTap: (index) {
              context.read<NavbarViewModel>().changeIndex(index);
            },
          ),
          body: context
              .read<NavbarViewModel>()
              .pageList[context.read<NavbarViewModel>().currentIndex],
        );
      }),
    );
  }
}
