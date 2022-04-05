import 'package:equatable/equatable.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/models/api/api_response_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class ApiException extends Equatable
{
  final String message;

  const ApiException({
    this.message = ''
  });

  ApiResponse dataToApiResponse(responseData)
  {
    ApiResponse apiResponse = const ApiResponse(Data: null, Errors: null);

    try
    {
      apiResponse = ApiResponse.fromJson(responseData);
    }catch(err)
    {
      print('SERVER ERROR ${err}');
    }
    return apiResponse;
  }

  showException(String exMsg)
  {
    Fluttertoast.showToast(
      msg: exMsg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: HexColor(AppColors.errorColor),
      textColor: HexColor(AppColors.errorColor),
      fontSize: 12.0
    );
  }

  @override
  List<Object> get props => [message];
}