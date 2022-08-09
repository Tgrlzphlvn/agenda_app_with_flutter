import 'package:agenda_app_with_flutter/product/constants/project_constants.dart';

class TextFormFielValidator with ProjectConstants {
  String? isNotEmpty(String? value) {
    return (value?.isNotEmpty ?? false) ? null : nullTextField;
  }
}
