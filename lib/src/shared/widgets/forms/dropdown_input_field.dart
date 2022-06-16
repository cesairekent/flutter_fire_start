import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hexcolor/hexcolor.dart';

class DropdownInputField extends StatefulWidget {
  const DropdownInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.initialFormValue = '',
    required this.onSaved,
    required this.onChanged,
    required this.items,
    //required this.validator,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final String initialFormValue;
  final FormFieldSetter<String> onSaved;
  final Function(String?) onChanged;
  final List<String> items;
  //final FormFieldValidator<String> validator;

  @override
  State<DropdownInputField> createState() => _DropdownInputFieldState();
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: widget.name,
      // initialValue: 'Male',
      allowClear: true,
      //hint: Text(widget.hintText),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      onChanged: widget.onChanged,
      items: widget.items
          .map(
            (filter) => DropdownMenuItem(
              value: filter,
              child: Text(
                filter,
                style: TextStyle(
                  fontSize: AppFontSize.h7,
                  fontWeight: FontWeight.normal,
                  color: HexColor(AppColors.darkGray),
                ),
              ),
            ),
          )
          .toList(),
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
