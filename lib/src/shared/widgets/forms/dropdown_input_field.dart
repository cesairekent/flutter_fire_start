import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_fire_starter/src/core/app_configs/decoration.dart';
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
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final String initialFormValue;
  final FormFieldSetter<String> onSaved;
  final Function(String?) onChanged;
  final List<String> items;
  final AutovalidateMode autovalidateMode;

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
          [FormBuilderValidators.required()]),
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
      autovalidateMode: widget.autovalidateMode,
      decoration: AppDecoration.inputDecoartion(widget.labelText, widget.hintText),
    );
  }
}
