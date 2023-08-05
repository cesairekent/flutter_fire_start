import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final EdgeInsets loaderPadding;

  const CustomLoader
  ({
    Key? key,
    required this.child,
    this.isLoading = false,
    this.loaderPadding = const EdgeInsets.only(top: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return isLoading
        ? Container(
            alignment: Alignment.center,
            padding: loaderPadding,
            child: RefreshProgressIndicator(
              color: HexColor(AppColors.primary),
              strokeWidth: 2,
            ),
          )
        : child;
  }
}