import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadingIndicator extends StatelessWidget
{
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: HexColor(AppColors.primary),
        strokeWidth: 2,
      ),
    );
  }
}
