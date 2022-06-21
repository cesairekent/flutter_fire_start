import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.initialFormValue = '',
    required this.onSaved,
    this.validators,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final String initialFormValue;
  final FormFieldSetter<String> onSaved;
  final String? Function(String?)? validators;
  final AutovalidateMode autovalidateMode;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      obscureText: _obscureText,
      obscuringCharacter: '*',
      validator: widget.validators,
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
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: _obscureText
                ? HexColor(AppColors.gray)
                : HexColor(AppColors.primary),
          ),
        ),
      ),
    );
  }
}
