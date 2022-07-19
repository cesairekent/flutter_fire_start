
import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_fire_starter/src/core/app_configs/decoration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    this.validators,
    this.initialFormValue,
    this.disableLengthCheck = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isEnabled;
  final dynamic Function(PhoneNumber?) onSaved;
  final dynamic Function(PhoneNumber) onChanged;
  final String? Function(PhoneNumber?)? validators;
  final PhoneNumber? initialFormValue;
  final bool disableLengthCheck;
  final AutovalidateMode autovalidateMode;

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
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
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
            autovalidateMode: widget.autovalidateMode,
      decoration: AppDecoration.inputDecoartion(widget.labelText, widget.hintText),          ),
        );
      },
    );
  }
}
