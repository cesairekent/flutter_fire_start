import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hexcolor/hexcolor.dart';

class NumericInputField extends StatefulWidget
{
  const NumericInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.isReadOnly = false,
    this.initialFormValue = '',
    required this.onSaved,
    required this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isReadOnly;
  final String initialFormValue;
  final FormFieldSetter<String> onSaved;
  final FormFieldSetter<String> onChanged;
  final AutovalidateMode autovalidateMode;

  @override
  State<NumericInputField> createState() => _NumericInputFieldState();
}

class _NumericInputFieldState extends State<NumericInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      readOnly: widget.isReadOnly,
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        filled: true,
        focusColor: HexColor(AppColors.primary),
        fillColor: HexColor(AppColors.white),
        label: Text(
          widget.labelText,
          style: TextStyle(
            color: HexColor(AppColors.gray),
            fontSize: AppFontSize.h6,
          ),
        ),
        labelStyle: TextStyle(
          color: HexColor(AppColors.gray),
          fontSize: AppFontSize.h6,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: HexColor(AppColors.gray),
          fontSize: AppFontSize.h6,
        ),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: HexColor(AppColors.gray),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: HexColor(AppColors.lightGray),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: HexColor(AppColors.primary),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: HexColor(AppColors.errorColor),
          ),
        ),border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: HexColor(AppColors.gray),
          ),
        ),
      ),
    );
  }
}
