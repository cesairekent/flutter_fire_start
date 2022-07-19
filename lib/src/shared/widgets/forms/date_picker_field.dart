import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/decoration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DateTimePickerField extends StatefulWidget {
  const DateTimePickerField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.isEnabled = true,
    this.initialDateValue,
    this.initialTimeValue,
    this.validators,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isEnabled;
  final DateTime? initialDateValue;
  final TimeOfDay? initialTimeValue;
  final String? Function(DateTime?)? validators;

  @override
  State<DateTimePickerField> createState() => _DateTimePickerFieldState();
}

class _DateTimePickerFieldState extends State<DateTimePickerField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: widget.name,
      // onChanged: _onChanged,
      inputType: InputType.date,
      initialTime:
          widget.initialTimeValue ?? const TimeOfDay(hour: 12, minute: 00),
      initialValue: widget.initialDateValue,
      enabled: widget.isEnabled,
      validator: widget.validators,
      decoration:
          AppDecoration.inputDecoartion(widget.labelText, widget.hintText),
    );
  }
}
