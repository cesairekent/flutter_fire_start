import 'package:flutter_fire_starter/src/models/api/api_error_model.dart';

class ApiResponse
{
  final Object? data;
  final List<ApiError>? errors;

  const ApiResponse(
    {
      required this.data,
      required this.errors
    }
  );

  factory ApiResponse.fromJson(Map<String, dynamic> json)
  {
    final data = json['data'];
    final errors = json['errors'] as List<dynamic>? ?? [];
    final errorsList = errors.map((e) => ApiError.fromJson(e)).toList();

    return ApiResponse(
      data: data,
      errors: errorsList
    );
  }
}