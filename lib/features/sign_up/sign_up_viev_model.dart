import 'package:day_over/product/enums/auth_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends StateNotifier<ViewState> {
  SignUpNotifier(): super(ViewState.yesAuth);
  
}