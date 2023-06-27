import 'package:day_over/features/home/home_view.dart';
import 'package:day_over/features/sign_up/sign_up_view.dart';
import 'package:day_over/features/splash/splash_view_model.dart';
import 'package:day_over/product/enums/auth_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DecisionSplashView extends ConsumerWidget {
  const DecisionSplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthViewState state = ref.watch(splashProvider);

    return state == AuthViewState.noAuth
        ? const SignUpView()
        : const HomeView();
  }
}
