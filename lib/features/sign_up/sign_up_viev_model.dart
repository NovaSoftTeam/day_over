import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/repository/auth_repo.dart';
import 'package:day_over/product/services/authentication_services/auth_base.dart';
import 'package:day_over/product/utility/firebase_custom_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ViewState { idle, busy }

class SignViewNotifier extends StateNotifier<ViewState> implements AuthBase {
  final AuthRepository _authRepo = AuthRepository();

  SignViewNotifier() : super(ViewState.idle);

  @override
  Future<CurrentUserModel?> createUserWithEmail(
      String email, String password) async {
    try {
      state = ViewState.busy;
      return _authRepo.createUserWithEmail(email, password);
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<CurrentUserModel?> currentUser() async {
    try {
      state = ViewState.busy;
      return _authRepo.currentUser();
    } catch (e) {
      throw FirebaseCustomException(description: "$e");
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<CurrentUserModel?> signInWithEmail(
      String email, String password) async {
    try {
      state = ViewState.busy;
      return await _authRepo.signInWithEmail(email, password);
    } catch (e) {
      return null;
      //throw FirebaseCustomException(description: "$e");
    } finally {
      state = ViewState.idle;
    }
  }
}

final signViewProvider = StateNotifierProvider<SignViewNotifier, ViewState>((ref) {
  return SignViewNotifier();
});


