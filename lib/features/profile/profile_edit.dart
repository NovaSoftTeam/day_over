import 'package:day_over/features/profile/update_user_widget.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEdit extends ConsumerStatefulWidget {
  const ProfileEdit({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends ConsumerState<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    double containerHeight = 0;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      textSize = MediaQuery.of(context).size.height / 17;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    } else {
      textSize = MediaQuery.of(context).size.width / 17;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            StringConstants.editProfile,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: TextFontsConstants.glacialIndifferenceRegular,
              color: Colors.black,
              fontSize: textSize,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: containerHeight / 20,
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      shape: const CircleBorder(),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/informScreenImages/rick.png'),
                        radius: 80,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(StringConstants.editProfileImageText),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: SettingsForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
