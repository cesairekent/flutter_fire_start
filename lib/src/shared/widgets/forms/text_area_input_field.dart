import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hexcolor/hexcolor.dart';

class TextAreaInputField extends StatefulWidget {
  //TextInputField({Key? key}) : super(key: key);

  const TextAreaInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.isReadOnly = false,
    this.initialFormValue = '',
    this.minLines = 4,
    this.maxLines = 6,
    required this.onSaved,
    //required this.onChanged,
    //required this.validator,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isReadOnly;
  final String initialFormValue;
  final int minLines;
  final int maxLines;
  final FormFieldSetter<String> onSaved;
  //final FormFieldSetter<String> onChanged;
  //final FormFieldValidator<String> validator;

  @override
  State<TextAreaInputField> createState() => _TextAreaInputFieldState();
}

class _TextAreaInputFieldState extends State<TextAreaInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      readOnly: widget.isReadOnly,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
