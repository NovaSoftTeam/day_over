import 'package:day_over/features/profileScreen/update_user_widget.dart';
import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEdit extends ConsumerStatefulWidget {
  const ProfileEdit({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends ConsumerState<ProfileEdit> {
  late final TextEditingController adController;
  late final TextEditingController soyadController;
  late final TextEditingController yasController;
  late final TextEditingController kiloController;
  late final TextEditingController boyController;
  late final GlobalKey _key;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    adController = TextEditingController();
    soyadController = TextEditingController();
    yasController = TextEditingController();
    kiloController = TextEditingController();
    boyController = TextEditingController();
  }

  @override
  void dispose() {
    adController.dispose();
    soyadController.dispose();
    yasController.dispose();
    kiloController.dispose();
    boyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> list = <String>[
      'Kadın',
      'Erkek',
      'Diğer',
      'Belirtmek İstemiyorum'
    ];
    String dropdownValue = 'Belirtmek İstemiyorum';
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
                    Padding(
                      padding: const EdgeInsets.all(18.0),
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
