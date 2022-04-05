import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/api_routes.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_keys.dart';
import 'package:flutter_fire_starter/src/core/interceptors/api_exception.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Interceptors extends Interceptor
{
  String token = '';
  String refreshToken = '';
  final ApiException exception = const ApiException();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    try{
      final prefs = await  SharedPreferences.getInstance();
      String token = prefs.getString(AppKeys.token)??'';
    }catch(e){
      print(e);
    }

    if(token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    //print('RESPONSE[${response.statusCode}] => PATH: ${response.data?.path}');
    //ApiResponse apiResponse = exception.dataToApiResponse(response.data);
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async
  {
    if(err.response?.statusCode == 401) {
      try
      {
        await _dio.post(ApiRoutes.refreshToken,data: jsonEncode({"refresh_token": refreshToken})).then((value) async
        {
          if (value.statusCode == 201)
          {
            //get new tokens ...
            print("access token" + token);
            print("refresh token" + refreshToken);

            //set bearer
            err.requestOptions.headers["Authorization"] = "Bearer " + token;
            //create request with new access token
            final opts = Options(method: err.requestOptions.method, headers: err.requestOptions.headers);
            final cloneReq = await _dio.request(err.requestOptions.path, options: opts, data: err.requestOptions.data, queryParameters: err.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          }
            Fluttertoast.showToast(
              msg: "Refresh Token Error",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 10,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
            );
          }
        );
          return _dio;
      }
      catch (err, st)
      {
        Fluttertoast.showToast(
          msg: "Unknow Error",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );
        print(err);
        print(st);
        return err;
      }
    }
    return super.onError(err, handler);
  }
}