import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final TextEditingController epostController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var inputTextSize = MediaQuery.of(context).size.width / 28;
    var iconSize = MediaQuery.of(context).size.width / 20;
    var hintTextSize = MediaQuery.of(context).size.width / 25;
    double actionTextSize;

    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      actionTextSize = MediaQuery.of(context).size.height / 45;
    } else {
      actionTextSize = MediaQuery.of(context).size.width / 35;
    }

    var loginButtonTextSize = MediaQuery.of(context).size.height / 40;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.55,
                image: const AssetImage(ImagePathConstants.signInAppImage),
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CustomFormField(
                    hintText: StringConstants.signInEposta,
                    controller: epostController,
                    labelText: "E-posta",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    hintText: StringConstants.signInSifre,
                    controller: passwordController,
                    labelText: "Şifre",
                    isObscureText: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    //width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 20,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(13, 101, 248, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height),
                        ),
                      ),
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(fontSize: loginButtonTextSize),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("sa");
                        },
                        child: Text('Şifremi Unuttum',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorConstants.blue,
                                fontSize: actionTextSize)),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Hesap Oluştur',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorConstants.blue,
                              fontSize: actionTextSize),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
