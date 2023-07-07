import 'package:day_over/product/constants/color_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
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
    final TextEditingController cinsiyetController = TextEditingController();
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
              Container(
                child: Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 2.7,
                    child: Column(
                      children: [
                        SizedBox(
                          height: containerHeight / 20,
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                                'assets/informScreenImages/rick.png'),
                          ),
                          shape: CircleBorder(),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Profil fotografını değiştir'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomFormField(
                            controller: adController,
                            hintText: 'Adınızı Giriniz',
                            labelText: 'Adınızı Giriniz',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomFormField(
                            controller: soyadController,
                            hintText: 'Soyadınızı Giriniz',
                            labelText: 'Soyadınızı Giriniz',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomFormField(
                            controller: yasController,
                            hintText: 'Yasınızı Giriniz',
                            labelText: 'Yasınızı Giriniz',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomFormField(
                            controller: kiloController,
                            hintText: 'Kilonuzu Giriniz',
                            labelText: 'Kilonuzu Giriniz',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomFormField(
                            controller: boyController,
                            hintText: 'Boyunuzu Giriniz',
                            labelText: 'Boyunuzu Giriniz',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomFormField(
                            controller: boyController,
                            hintText: 'Cinsiyetinizi Giriniz',
                            labelText: 'Cinsiyetinizi Giriniz',
                          ),
                        ),
                        SizedBox(
                          height: containerHeight / 30,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
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
                                child: Text('Bilgileri Kaydet',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
