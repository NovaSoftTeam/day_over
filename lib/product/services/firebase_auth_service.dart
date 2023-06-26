import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/services/auth_base.dart';
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
      print("$e exception");
    }
  }

  @override
  Future<CurrentUserModel?> createUserWithEmail(
      String email, String password) async {
    try {
      final credential = await _authService.createUserWithEmailAndPassword(
          email: email, password: password);
      return userFromFirebase(credential.user!);
    } catch (e) {
      //throw FirebaseCustomException(description: "$e");
      return null;
    }
  }

  @override
  Future<CurrentUserModel?> signInWithEmail(
      String email, String password) async {
    try {
      final credential = await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return userFromFirebase(credential.user!);
    } catch (e) {
      //throw FirebaseCustomException(description: "$e");
      return null;
    }
  }

  CurrentUserModel? userFromFirebase(User userFirebase) {
    if (userFirebase == null) {
      return null;
    } else {
      return CurrentUserModel(userId: userFirebase.uid);
    }
  }
  
}
