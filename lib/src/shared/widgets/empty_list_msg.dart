import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
import 'package:hexcolor/hexcolor.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppFontSize.h6,
              fontWeight: FontWeight.bold,
              color: HexColor(AppColors.gray),
            ),
          ),
        ],
      ),
    );
  }
}