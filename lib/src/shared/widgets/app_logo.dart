import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget
{
  const AppLogo({Key? key, required this.height, required this.margin}) : super(key: key);

  final double height;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      margin: margin,
      child: Image.asset(
        'assets/images/icons/appIcon/logo.png',
        height: height,
      ),
    );
  }
}
