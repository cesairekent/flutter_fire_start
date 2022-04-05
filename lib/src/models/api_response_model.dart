import 'package:flutter_fire_starter/src/models/api_error_model.dart';

class ApiResponse
{
  final Object? Data;
  final List<ApiError>? Errors;

  const ApiResponse(
    {
      required this.Data,
      required this.Errors
    }
  );

  factory ApiResponse.fromJson(Map<String, dynamic> json)
  {
    final data = json['data'];
    final errors = json['errors'] as List<dynamic>? ?? [];
    final errorsList = errors.map((e) => ApiError.fromJson(e)).toList();

    return ApiResponse(
      Data: data,
      Errors: errorsList
    );
  }
}