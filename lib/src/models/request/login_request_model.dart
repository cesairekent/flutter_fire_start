import 'package:equatable/equatable.dart';

class LoginUserRequestModel extends Equatable
{
  final String email;
  final String password;

  const LoginUserRequestModel({
    required this.email,
    required this.password
  });

  @override
  List<Object> get props => [email, password];

  factory LoginUserRequestModel.fromMap(Map<String, dynamic> map)
  {
    return LoginUserRequestModel(
      password: map['password'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson(){
    final queryParams = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return queryParams;
  }
}