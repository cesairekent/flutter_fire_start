import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckboxInputField extends StatefulWidget
{
  const CheckboxInputField({
    Key? key,
    required this.name,
    required this.labelText,
    this.validators,
    required this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String? Function(bool?)? validators;
  final Function(bool?) onChanged;
  final AutovalidateMode autovalidateMode;

  @override
  State<CheckboxInputField> createState() => _CheckboxInputFieldState();
}

class _CheckboxInputFieldState extends State<CheckboxInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: widget.name,
      initialValue: true,
      onChanged: widget.onChanged,
      activeColor: HexColor(AppColors.primary),
      title: Text(
        widget.labelText,
        style: TextStyle(
          fontSize: AppFontSize.h6,
          color: HexColor(AppColors.gray),
        ),
      ),
      validator: widget.validators,
      autovalidateMode: widget.autovalidateMode,
    );
  }
}
