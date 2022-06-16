import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';

class BasicButton extends StatelessWidget
{
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String btnText;
  final VoidCallback? onPressed;
  final double elevation;

  const BasicButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.btnText,
    this.elevation = 5.0,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(30.0),
      color: borderColor,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          color: backgroundColor,
        ),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.h6,
              ),
          ),
        ),
      ),
    );
  }
}
