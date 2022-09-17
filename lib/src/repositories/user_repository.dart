import 'package:flutter_fire_starter/src/models/entities/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>>? allUsers();
}
