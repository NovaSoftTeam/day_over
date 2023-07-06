import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SignInView extends  ConsumerStatefulWidget{
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final TextEditingController epostController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.55,
                image: AssetImage('assets/images/wc_dayover.png'),
                alignment: Alignment.topCenter,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 40,
                    top: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 40,
                    bottom: MediaQuery.of(context).size.height / 300,
                  ),
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18) *
                        MediaQuery.of(context).size.height,
                    border: Border.all(width: 1.0, color: Colors.grey),
                  ),
                  height: MediaQuery.of(context).size.height / 20,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width /25//hayalet yaz
                      ),
                      controller: epostController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'E-posta',
                        labelStyle: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.width /28),//input e posta
                        prefixIcon: Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.width /20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 40,
                      top: 0,
                      right: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 400),
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18) *
                        MediaQuery.of(context).size.height,
                    border: Border.all(width: 1.0, color: Colors.grey),
                  ),
                  height: MediaQuery.of(context).size.height / 20,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width /25
                      ),//input hayalet yazı
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Şifre',
                        labelStyle: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.width /28),//input şifre
                        prefixIcon: Icon(
                          Icons.lock,
                          size: MediaQuery.of(context).size.width /20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          iconSize: MediaQuery.of(context).size.width /20,
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 40,
                      top: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 40,
                      bottom: MediaQuery.of(context).size.height / 60),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 20,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(13, 101, 248, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18) *
                            MediaQuery.of(context).size.height,
                      ),
                    ),
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width /20),
                    ),
                  ),
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
                              color: Colors.blue,
                              fontSize:
                              MediaQuery.of(context).size.width /28)),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Hesap Oluştur',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize:
                            MediaQuery.of(context).size.width /28),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
