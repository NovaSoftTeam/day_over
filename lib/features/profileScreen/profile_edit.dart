import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController adController = TextEditingController();
    final TextEditingController soyadController = TextEditingController();
    final TextEditingController yasController = TextEditingController();
    final TextEditingController kiloController = TextEditingController();
    final TextEditingController boyController = TextEditingController();
    double textSize = 0;
    double containerWidth = 0;
    double containerHeight = 0;
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      textSize = MediaQuery.of(context).size.height / 17;
      containerWidth = MediaQuery.of(context).size.width / 2;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    } else {
      textSize = MediaQuery.of(context).size.width / 17;
      containerWidth = MediaQuery.of(context).size.width;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GlacialIndifference-Regular',
                color: Colors.black,
                fontSize: textSize,
              ),
              'Profili Düzenle'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height / 2.7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: containerHeight / 20,
                      ),
                      RawMaterialButton(
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/informScreenImages/rick.png'),
                          radius: 60,
                        ),
                        onPressed: () {},
                        elevation: 2.0,
                        shape: const CircleBorder(),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(StringConstants.editProfileImageText),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomFormField(
                          controller: adController,
                          labelText: StringConstants.enterName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomFormField(
                          controller: soyadController,
                          labelText: StringConstants.enterSurname,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomFormField(
                          keyBoardType: TextInputType.number,
                          controller: yasController,
                          labelText: StringConstants.enterAge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomFormField(
                          keyBoardType: TextInputType.number,
                          controller: kiloController,
                          labelText: StringConstants.enterWeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomFormField(
                          keyBoardType: TextInputType.number,
                          controller: boyController,
                          labelText: StringConstants.enterHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomFormField(
                          controller: boyController,
                          labelText: StringConstants.enterGender,
                        ),
                      ),
                      SizedBox(
                        height: containerHeight / 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: containerWidth / 2,
                            height: containerHeight / 10,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstants.mainBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(StringConstants.editProfileButtontText,
                                  style: TextStyle(
                                      fontSize: textSize / 1.25,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: containerHeight / 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
