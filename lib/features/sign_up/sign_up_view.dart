import 'package:day_over/features/sign_up/sign_up_viev_model.dart';
import 'package:day_over/features/splash/splash_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onPressedCall() async {
    final state = ref.read(splashProvider.notifier);

    final signViewModel = ref.read(signViewProvider.notifier);

    bool isValid = _key.currentState!.validate();
    if (isValid) {
      _key.currentState!.save();

      final user = await signViewModel.signInWithEmail(
          _emailController.text, _passwordController.text);
      if (user == null) {
        state.handleSignOut();
      } else {
        state.handleAuthentication();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(signViewProvider);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: viewState == ViewState.idle
          ? Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomFormField(
                            controller: _emailController,
                            labelText: "Email",
                            hintText: "Email",
                            icon: const Icon(Icons.mail),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomFormField(
                            controller: _passwordController,
                            hintText: "Password",
                            labelText: "Password",
                            icon: const Icon(Icons.lock),
                            isObscureText: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                onPressedCall();
                              },
                              child: Text(
                                StringConstants.signUpButtonText,
                                style: context.textTheme.headlineSmall
                                    ?.copyWith(
                                        color: ColorConstants.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstants.purpleDark,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: const [
                                 Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text("OR"),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/google_logo.jpg",
                                height: 50,
                              ),
                              const Text("  Log in with Google"),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            )
          : LoadingAnimationWidget.hexagonDots(
              color: Colors.black,
              size: 100,
            ),
    );
  }
}
