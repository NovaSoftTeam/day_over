import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/services/auth_base.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService extends AuthBase {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  @override
  Future<CurrentUserModel?> currentUser() async {
    try {
      User? user = _authService.currentUser;
      if (user == null) {
        return null;
      } else {
        return userFromFirebase(user);
      }
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  @override
  Future<CurrentUserModel?> createUserWithEmail(
      String email, String password) async {
    try {
      final credential = await _authService.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user == null
          ? null
          : userFromFirebase(credential.user!);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  @override
  Future<CurrentUserModel?> signInWithEmail(
      String email, String password) async {
    try {
      final credential = await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user == null
          ? null
          : userFromFirebase(credential.user!);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    }
  }

  CurrentUserModel userFromFirebase(User userFirebase) {
    return CurrentUserModel(userId: userFirebase.uid);
  }
}
