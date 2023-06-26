import 'package:day_over/product/models/current_user_model.dart';

abstract class AuthBase {
  Future<CurrentUserModel?> signInWithEmail(String email, String password);
  Future<CurrentUserModel?> createUserWithEmail(String email, String password);
  Future<CurrentUserModel?> currentUser();
}
