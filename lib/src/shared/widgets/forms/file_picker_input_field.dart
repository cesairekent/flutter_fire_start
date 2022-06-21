import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:hexcolor/hexcolor.dart';

class FilePickerInputField extends StatefulWidget {
  const FilePickerInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    required this.uploadText,
    this.isReadOnly = false,
    this.initialFormValue = '',
    required this.onFileLoading,
    required this.onChanged,
    //required this.validator,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final String uploadText;
  final bool isReadOnly;
  final String initialFormValue;
  final Function(FilePickerStatus) onFileLoading;
  final Function(List<PlatformFile?>?) onChanged;
  //final FormFieldValidator<String> validator;

  @override
  State<FilePickerInputField> createState() => _FilePickerInputFieldState();
}

class _FilePickerInputFieldState extends State<FilePickerInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderFilePicker(
      name: widget.name,
      maxFiles: null,
      previewImages: true,
      onChanged: widget.onChanged, //(val) => print(val),
      selector: Row(
        children: <Widget>[
          Icon(
            Icons.file_upload,
            color: HexColor(
              AppColors.gray,
            ),
          ),
          Text(
            widget.uploadText,
            style: TextStyle(
              color: HexColor(AppColors.gray),
              fontSize: AppFontSize.h6,
            ),
          ),
        ],
      ),
      onFileLoading: widget.onFileLoading,
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
