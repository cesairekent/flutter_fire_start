import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:hexcolor/hexcolor.dart';

class AppDecoration {
  static inputDecoartion(
      String labelText, String hintText) {
    return InputDecoration(
      filled: true,
      focusColor: HexColor(AppColors.primary),
      fillColor: HexColor(AppColors.white),
      label: Text(
        labelText,
        style: TextStyle(
          color: HexColor(AppColors.gray),
          fontSize: AppFontSize.h6,
        ),
      ),
      labelStyle: TextStyle(
        color: HexColor(AppColors.gray),
        fontSize: AppFontSize.h6,
      ),
      hintText: hintText,
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
      // suffixIcon: GestureDetector(
      //   onTap: () {
      //     setState(() {
      //       _obscureText = !_obscureText;
      //     });
      //   },
      //   child: Icon(
      //     _obscureText ? Icons.visibility_off : Icons.visibility,
      //     color: _obscureText
      //         ? HexColor(AppColors.gray)
      //         : HexColor(AppColors.primary),
      //   ),
      // ),
    );
  }
}
