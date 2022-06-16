import 'package:flutter/foundation.dart';

class ApiRoutes
{
  // Base Url
  static const String baseUrl = kDebugMode? 'http://159.65.225.250:8000/api/' : 'http://159.65.225.250:8000/api/';
  static const String fileUrl = kDebugMode? 'http://159.65.225.250:8000' : 'http://159.65.225.250:8000';

  // Auth Url
  static const String register = baseUrl +'user';
  static const String login = baseUrl +'user/login';
  static const String refreshToken = baseUrl + 'user/refresh';
}