import 'package:day_over/features/sign_up/sign_up_viev_model.dart';
import 'package:day_over/features/splash/splash_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:day_over/product/widgets/sign_up_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  late final GlobalKey<FormState> _key;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

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
      //backgroundColor: Colors.grey[300],
      body: viewState == ViewState.idle
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const SignUpAppBarWidget(),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          StringConstants.signUpText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                    child: Form(
                        key: _key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomFormField(
                              controller: _usernameController,
                              labelText: "Username",
                              hintText: "Username",
                              icon: const Icon(Icons.person),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
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
                            customFormSubmitButton(),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        foregroundColor:
                                            ColorConstants.mainBlueColor),
                                    onPressed: () {},
                                    child: const Text(
                                        StringConstants.haveAccountText))
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          : LoadingAnimationWidget.hexagonDots(
              color: Colors.black,
              size: 100,
            ),
    );
  }

  Widget customFormSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          onPressedCall();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.mainBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(StringConstants.signUpText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
