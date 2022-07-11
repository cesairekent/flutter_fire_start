import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppToastMessage
{
  static SnackBar toast(String message, String actionText, String bgColor) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: HexColor(AppColors.white),
          fontSize: AppFontSize.h7,
        ),
      ),
      duration: const Duration(seconds: 20),
      backgroundColor: HexColor(bgColor),
      action: SnackBarAction(
        onPressed: () => {},
        label: actionText,
        textColor: HexColor(AppColors.white),
      ),
    );
    return snackBar;
  }

  static Alert popupAlert(BuildContext context, String title, String message,
      String actionText, AlertType alertType) {
    final alert = Alert(
      context: context,
      type: alertType,
      title: title,
      desc: message,
      style: AlertStyle(
        alertElevation: 10,
        backgroundColor: HexColor(AppColors.white),
        descStyle: TextStyle(
          color: HexColor(AppColors.gray),
          fontSize: AppFontSize.h7,
        ),
        titleStyle: TextStyle(
          color: HexColor(AppColors.darkGray),
          fontSize: AppFontSize.h6,
          fontWeight: FontWeight.w700,
        ),
      ),
      buttons: [
        DialogButton(
          color: HexColor(AppColors.primary),
          child: Text(
            actionText,
            style: TextStyle(
              color: HexColor(AppColors.white),
              fontSize: AppFontSize.h7,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    return alert;
  }

  static Alert confirmDeletePopupAlert(
      BuildContext context,
      String title,
      String message,
      String actionText,
      String deleteText,
      Function() onDeletePressed) {
    final alert = Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: message,
      style: AlertStyle(
        alertElevation: 10,
        backgroundColor: HexColor(AppColors.white),
        descStyle: TextStyle(
          color: HexColor(AppColors.gray),
          fontSize: AppFontSize.h7,
        ),
        titleStyle: TextStyle(
            color: HexColor(AppColors.darkGray),
            fontSize: AppFontSize.h6,
            fontWeight: FontWeight.w700),
      ),
      buttons: [
        DialogButton(
          color: HexColor(AppColors.primary),
          child: Text(
            actionText,
            style: TextStyle(
              color: HexColor(AppColors.white),
              fontSize: AppFontSize.h7,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        DialogButton(
          color: HexColor(AppColors.red),
          onPressed: onDeletePressed,
          child: Text(
            deleteText,
            style: TextStyle(
              color: HexColor(AppColors.white),
              fontSize: AppFontSize.h7,
              fontWeight: FontWeight.bold,
            ),
          ), //() => Navigator.pop(context),
        )
      ],
    );
    return alert;
  }

  /// Popup alert for error message
  /// Please Use it in Scaffold Widget
  static showErrorToast(BuildContext context, String message) {
    final snackBar = toast(
      message,
      AppLocalizations.of(context)!.btn_ok,
      AppColors.errorColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Popup alert for success message
  /// Please Use it in Scaffold Widget
  static showSuccessToast(BuildContext context, String message) {
    final snackBar = toast(
      message,
      AppLocalizations.of(context)!.btn_ok,
      AppColors.successColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
