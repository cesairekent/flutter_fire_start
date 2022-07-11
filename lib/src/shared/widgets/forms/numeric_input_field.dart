import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/decoration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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

class _NumericInputFieldState extends State<NumericInputField>
{
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      readOnly: widget.isReadOnly,
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autovalidateMode,
      decoration: AppDecoration.inputDecoartion(widget.labelText, widget.hintText),
    );
  }
}
