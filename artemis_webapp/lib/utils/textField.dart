import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greyAccentLine),
      ),
      child: TextFormField(
        autofocus: false,
        controller: textEditingController,
        style: AppTextStyles.title2,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppTextStyles.subtitle3,
          border: InputBorder.none,
        ),
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return "required";
          }
          return null;
        },
      ),
    );
  }
}
