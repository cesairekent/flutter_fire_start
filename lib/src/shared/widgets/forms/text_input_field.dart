import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/decoration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextInputField extends StatefulWidget
{
  const TextInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.isEnabled = true,
    this.initialFormValue = '',
    required this.onSaved,
    this.validators,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isEnabled;
  final String initialFormValue;
  final FormFieldSetter<String> onSaved;
  final String? Function(String?)? validators;
  final FormFieldSetter<String>? onChanged;
  final AutovalidateMode autovalidateMode;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      enabled: widget.isEnabled,
      validator: widget.validators,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autovalidateMode,
      decoration: AppDecoration.inputDecoartion(widget.labelText, widget.hintText),    );
  }
}
