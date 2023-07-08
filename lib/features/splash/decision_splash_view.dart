import 'package:day_over/features/dashboard/dashboard.dart';
import 'package:day_over/features/sign_in/sign_in_view.dart';
import 'package:day_over/features/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DecisionSplashView extends ConsumerWidget {
  const DecisionSplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthViewState state = ref.watch(splashProvider);

    return state == AuthViewState.noAuth
        ? const SignInView()
        : const Dashboard();
  }
}

