// import 'package:flutter/material.dart';
// import 'package:flutter_fire_starter/src/core/app_configs/app_font_size.dart';
// import 'package:flutter_fire_starter/src/shared/widgets/loading_indicator.dart';
// import 'package:flutter_fire_starter/src/view_models/base_view_model.dart';
// import 'package:provider/provider.dart';

// class LoadingButton extends StatefulWidget
// {
//   final Color backgroundColor;
//   final Color borderColor;
//   final Color textColor;
//   final String btnText;
//   final VoidCallback? onPressed;
//   final double elevation;

//   const LoadingButton({
//     Key? key,
//     required this.onPressed,
//     required this.backgroundColor,
//     required this.borderColor,
//     required this.textColor,
//     required this.btnText,
//     this.elevation = 5.0,
//   }) : super(key: key);

//   @override
//   State<LoadingButton> createState() => _LoadingButtonState();
// }

// class _LoadingButtonState extends State<LoadingButton>
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     var baseVM = context.watch<BaseVM>();
//     return !baseVM.isLoading
//         ? Material(
//             elevation: widget.elevation,
//             borderRadius: BorderRadius.circular(30.0),
//             color: widget.borderColor,
//             child: Container(
//               padding: EdgeInsets.zero,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 border: Border.all(
//                   color: widget.borderColor,
//                   width: 1.0,
//                 ),
//                 color: widget.backgroundColor,
//               ),
//               child: MaterialButton(
//                 minWidth: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.zero,
//                 onPressed: widget.onPressed,
//                 child: Text(
//                   widget.btnText,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: widget.textColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: AppFontSize.buttonFontSize,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         : const LoadingIndicator();
//   }
// }
