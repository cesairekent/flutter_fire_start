class ApiError
{
  final int code;
  final String message;

  const ApiError(
    {
      required this.code,
      required this.message
    }
  );

  factory ApiError.fromJson(Map<String, dynamic> json)
  {
    final code = json['code'];
    final message = json['message'];

    return ApiError(
      code: code,
      message: message
    );
  }
}