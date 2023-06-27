import 'package:day_over/product/enums/auth_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplasViewNotifier extends StateNotifier<AuthViewState> {
  SplasViewNotifier() : super(AuthViewState.noAuth);

  handleAuthentication() {
    state = AuthViewState.yesAuth;
  }

  handleSignOut() {
    state = AuthViewState.noAuth;
  }
}

final splashProvider =
    StateNotifierProvider<SplasViewNotifier, AuthViewState>((ref) {
  return SplasViewNotifier();
});
