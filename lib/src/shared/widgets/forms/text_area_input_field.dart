import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/decoration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextAreaInputField extends StatefulWidget {

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
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isReadOnly;
  final String initialFormValue;
  final int minLines;
  final int maxLines;
  final FormFieldSetter<String> onSaved;
  final AutovalidateMode autovalidateMode;

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
      autovalidateMode: widget.autovalidateMode,
      decoration: AppDecoration.inputDecoartion(widget.labelText, widget.hintText),    );
  }
}
