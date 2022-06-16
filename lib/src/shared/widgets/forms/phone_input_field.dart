import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberInputField extends StatefulWidget {
  const PhoneNumberInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.isEnabled = true,
    required this.onSaved,
    required this.onChanged,
    //required this.validator,
    this.validators,
    //required this.onFieldSubmitted,
    this.initialFormValue,
    this.disableLengthCheck = false,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isEnabled;
  final dynamic Function(PhoneNumber?) onSaved;
  final dynamic Function(PhoneNumber) onChanged;
  //final FutureOr<String?> Function(PhoneNumber?)? validator;
  final String? Function(PhoneNumber?)? validators;
  //final FormFieldValidator<String> validator;
  //final ValueChanged<String> onFieldSubmitted;
  final PhoneNumber? initialFormValue;
  final bool disableLengthCheck;

  @override
  State<PhoneNumberInputField> createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      validator: widget.validators,
      builder: (FormFieldState<dynamic> field) {
        return InputDecorator(
          child: IntlPhoneField(
            enabled: widget.isEnabled,
            initialValue: widget.initialFormValue != null? widget.initialFormValue!.number:'',
            flagsButtonPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            dropdownTextStyle: TextStyle(
              fontSize: AppFontSize.h6,
              color: HexColor(AppColors.gray),
            ),
            textAlignVertical: TextAlignVertical.center,
            dropdownIcon: Icon(
              Icons.arrow_drop_down,
              color: HexColor(AppColors.gray),
            ),
            dropdownIconPosition: IconPosition.trailing,
            showDropdownIcon: true,
            showCountryFlag: true,
            disableLengthCheck: widget.disableLengthCheck,
            style: TextStyle(
              //fontFamily: 'poppins',
              color: HexColor(AppColors.gray),
              fontSize: AppFontSize.h6,
            ),
            initialCountryCode: 'CM',
            onChanged: (value) => field.didChange(value), //widget.onChanged,
            onSaved:(value) => field.save(), //widget.onSaved,
            //validator: widget.validator,
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
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: HexColor(AppColors.gray),
                ),
              ),
            ),
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}
