import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';

class FlatBtn extends StatelessWidget {
  final Color textColor;
  final String btnText;
  final VoidCallback? onPressed;

  const FlatBtn({
    Key? key,
    required this.onPressed,
    required this.textColor,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.h7,
        ),
      ),
    );
  }
}
