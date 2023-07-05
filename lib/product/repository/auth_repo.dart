import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/services/authentication_services/auth_base.dart';
import 'package:day_over/product/services/authentication_services/firebase_auth_service.dart';

enum AppMode { debug, release }

class AuthRepository implements AuthBase {
  final FireBaseAuthService _authService = FireBaseAuthService();

  // if appmode is debug then firebase services works
  AppMode appMode = AppMode.debug;

  @override
  Future<CurrentUserModel?> createUserWithEmail(
      String email, String password) async {
    if (appMode == AppMode.debug) {
      return await _authService.createUserWithEmail(email, password);
    } else {
      return CurrentUserModel(userId: "1900929102909012021");
    }
  }

  @override
  Future<CurrentUserModel?> currentUser() async {
    if (appMode == AppMode.debug) {
      return await _authService.currentUser();
    } else {
      return CurrentUserModel(userId: "1900929102909012021");
    }
  }

  @override
  Future<CurrentUserModel?> signInWithEmail(
      String email, String password) async {
    if (appMode == AppMode.debug) {
      return await _authService.signInWithEmail(email, password);
    } else {
      return CurrentUserModel(userId: "1900929102909012021");
    }
  }
}
