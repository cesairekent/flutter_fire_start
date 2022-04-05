class ApiError
{
  final int Code;
  final String Message;

  const ApiError(
    {
      required this.Code,
      required this.Message
    }
  );

  factory ApiError.fromJson(Map<String, dynamic> json)
  {
    final code = json['code'];
    final message = json['message'];

    return ApiError(
      Code: code,
      Message: message
    );
  }
}