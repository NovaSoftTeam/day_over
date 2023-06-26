import 'package:day_over/product/enums/auth_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplasViewNotifier extends StateNotifier<ViewState> {
  SplasViewNotifier() : super(ViewState.noAuth);

  handleAuthentication() {
    state = ViewState.yesAuth;
  }

  handleSignOut() {
    state = ViewState.noAuth;
  }
}

final splashProvider =
    StateNotifierProvider<SplasViewNotifier, ViewState>((ref) {
  return SplasViewNotifier();
});
