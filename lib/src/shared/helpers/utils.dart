import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Utils
{
  static final RegExp passwordValidatorRegex =
      RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  passwordMatchValidator(String? value, String? compareValue, BuildContext context)
  {
    if (value == null) return null;
    if (value != compareValue) {
      return AppLocalizations.of(context)!.form_error_password_confirm_match;
    }
    return null;
  }

  passwordStrengthValidator(String? value, BuildContext context)
  {
    if (value == null) return null;
    if (!value.contains(Utils.passwordValidatorRegex))
    {
      return AppLocalizations.of(context)!.form_error_password_contraint;
    }
    return null;
  }
}
