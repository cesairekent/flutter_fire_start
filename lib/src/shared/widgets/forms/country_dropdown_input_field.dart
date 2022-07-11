import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hexcolor/hexcolor.dart';

class CountryDropDownInputField extends StatefulWidget {
  const CountryDropDownInputField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.isEnabled = true,
    required this.onChanged,
    this.validators,
    required this.initialFormValue,
    this.isReadOnly = false,
    this.maxLines = 1,
  }) : super(key: key);

  final String name;
  final String labelText;
  final String hintText;
  final bool isEnabled;
  final Function(CountryCode) onChanged;
  final String? Function(String?)? validators;
  final String? initialFormValue;
  final bool isReadOnly;
  final int maxLines;

  @override
  State<CountryDropDownInputField> createState() =>
      _CountryDropDownFieldInputState();
}

class _CountryDropDownFieldInputState extends State<CountryDropDownInputField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: widget.name,
      initialValue: widget.initialFormValue,
      validator: widget.validators,
      builder: (FormFieldState<dynamic> field)
      {
        return InputDecorator(
          decoration: InputDecoration(
            filled: true,
            enabled: widget.isEnabled,
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
            errorText: widget.validators != null ? field.errorText : null,
          ),

          child: CountryCodePicker(
            padding: EdgeInsets.zero,
            onChanged: (value) => field.didChange(value.name),
            showDropDownButton: true,
            enabled: widget.isEnabled,
            initialSelection: widget.initialFormValue,
            favorite: const ['+237', 'FR'],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            alignLeft: true,
            textStyle: TextStyle(
              color: HexColor(AppColors.gray),
              fontSize: AppFontSize.h6,
            ),
            searchStyle: TextStyle(
              color: HexColor(AppColors.gray),
              fontSize: AppFontSize.h6,
            ),
            dialogTextStyle: TextStyle(
              color: HexColor(AppColors.gray),
              fontSize: AppFontSize.h6,
            ),
            closeIcon: Icon(
              Icons.close,
              color: HexColor(AppColors.gray),
            ),
            barrierColor: HexColor(AppColors.white),
            boxDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: HexColor(AppColors.trueWhite),
            ),
            flagDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
              color: HexColor(
                AppColors.white,
              ),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2,
                  color: Colors.black12,
                ),
              ],
            ),
            searchDecoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: HexColor(AppColors.gray),
              ),
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: HexColor(AppColors.gray)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: HexColor(AppColors.lightGray)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: HexColor(AppColors.errorColor)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: HexColor(AppColors.primary)),
              ),
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: HexColor(
                  AppColors.gray,
                ),
                fontSize: AppFontSize.h6,
              ),
            ),
          ),
        );
      },
    );
  }
}
