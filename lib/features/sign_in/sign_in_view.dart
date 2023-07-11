import 'package:day_over/features/sign_up/sign_up_view.dart';
import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/features/splash/splash_view_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_circular_indicator.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:day_over/product/widgets/sign_up_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  late final GlobalKey<FormState> _key;
  late final TextEditingController _epostController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _epostController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _epostController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void singInCall() async {
    final signViewModel = ref.read(signViewProvider.notifier);
    final state = ref.read(splashProvider.notifier);

    bool isValid = _key.currentState!.validate();
    if (isValid) {
      _key.currentState!.save();
      final user = await signViewModel.signInWithEmail(
          _epostController.text, _passwordController.text);
      if (user == null) {
        state.handleSignOut();
      } else {
        ref.read(userUidProvider.notifier).changeUserId(user.userId);
        state.handleAuthentication();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double actionTextSize;

    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      actionTextSize = MediaQuery.of(context).size.height / 45;
    } else {
      actionTextSize = MediaQuery.of(context).size.width / 35;
    }

    ViewState viewState = ref.watch(signViewProvider);

    return Scaffold(
        backgroundColor: ColorConstants.white,
        body: viewState == ViewState.idle
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.55,
                        image:
                            const AssetImage(ImagePathConstants.signInAppImage),
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.all(18.0),
                              child: SignUpTextWidget(
                                signText: StringConstants.signInText,
                              )),
                          Form(
                              key: _key,
                              child: Column(
                                children: [
                                  CustomFormField(
                                    leadingIcon: const Icon(Icons.email),
                                    controller: _epostController,
                                    labelText: "E-posta",
                                    keyBoardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomFormField(
                                    leadingIcon: const Icon(Icons.lock),
                                    controller: _passwordController,
                                    labelText: "Şifre",
                                    isObscureText: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        singInCall();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorConstants.mainBlueColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                  .size
                                                  .height),
                                        ),
                                      ),
                                      child: const Text(
                                        StringConstants.signInText,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        foregroundColor:
                                            ColorConstants.mainBlueColor),
                                    onPressed: () {},
                                    child: const Text(
                                        StringConstants.forgotPassword)),
                              ),
                              Expanded(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        foregroundColor:
                                            ColorConstants.mainBlueColor),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return const SignUpView();
                                        },
                                      ));
                                    },
                                    child: const Text(
                                        StringConstants.createAccount)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const CustomCircularIndicator());
  }
}
