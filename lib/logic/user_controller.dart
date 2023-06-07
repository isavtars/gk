import 'package:get/get.dart';
import 'package:gharkhracha/resources/auth_resources.dart';

import '../model/user_models.dart';
//Users from Users models

class UserController extends GetxController {
  Users? _users;

  Users? get getUsers => _users;

  final AuthMethods _authMethods = AuthMethods();

  Future<void> refressUser() async {
    Users? users = await _authMethods.getuserDetails();
    _users = users;
    update();
  }
}
