import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/services/auth_base.dart';
import 'package:day_over/product/services/firebase_auth_service.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthBase _authService = FireBaseAuthService(); 

  void onPressedCall() async{
    bool isValid = _key.currentState!.validate();
    if (isValid) {
      _key.currentState!.save();

      // final _user = await _authService.createUserWithEmail(_emailController.text, _passwordController.text);
      // print(_user!.userId);
      final _user = await _authService.signInWithEmail(_emailController.text, _passwordController.text);
      print(_user!.userId);
      //print("Email : ${_emailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                          style: context.textTheme.headlineSmall?.copyWith(
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
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
