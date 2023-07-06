import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(appBarText: "Profile", textSize: textSize),
                Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: containerHeight / 20,
                        ),
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/informScreenImages/rick.png'),
                        ),
                        Text(
                          style: TextStyle(
                            fontFamily: 'glacial-indifference-bold',
                            fontSize: textSize,
                          ),
                          'Rick Sanchez',
                        ),
                        Text(
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference-Regular',
                            fontSize: textSize / 1.5,
                          ),
                          'PickleRickkkk@gmail.com',
                        ),
                        SizedBox(
                          height: containerHeight / 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  style: TextStyle(
                                    fontFamily: TextFontsConstants
                                        .glacialIndifferenceRegular,
                                    fontSize: textSize / 1.5,
                                  ),
                                  'age: 70',
                                ),
                                SizedBox(
                                  height: containerHeight / 40,
                                ),
                                Text(
                                  style: TextStyle(
                                    fontFamily: TextFontsConstants
                                        .glacialIndifferenceRegular,
                                    fontSize: textSize / 1.5,
                                  ),
                                  'boy: 196',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  style: TextStyle(
                                    fontFamily: TextFontsConstants
                                        .glacialIndifferenceRegular,
                                    fontSize: textSize / 1.5,
                                  ),
                                  'kilo: 86',
                                ),
                                SizedBox(
                                  height: containerHeight / 40,
                                ),
                                Text(
                                  style: TextStyle(
                                    fontFamily: TextFontsConstants
                                        .glacialIndifferenceRegular,
                                    fontSize: textSize / 1.5,
                                  ),
                                  'cinsiyet: erkek',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: containerHeight / 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        StringConstants.editProfile,
                        style: TextStyle(
                          fontFamily: 'glacial-indifference-bold',
                          fontSize: textSize / 1.5,
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage(ImagePathConstants.editProfileImage),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      StringConstants.settings,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: textSize / 1.15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        StringConstants.aboutApp,
                        style: TextStyle(
                          fontFamily: 'glacial-indifference-bold',
                          fontSize: textSize / 1.5,
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage(ImagePathConstants.aboutImage),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        StringConstants.voteApp,
                        style: TextStyle(
                          fontFamily: 'glacial-indifference-bold',
                          fontSize: textSize / 1.5,
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage(ImagePathConstants.voteImage),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                        onTap: () {},
                        title: Text(
                          StringConstants.shareApp,
                          style: TextStyle(
                            fontFamily: 'glacial-indifference-bold',
                            fontSize: textSize / 1.5,
                          ),
                        ),
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage(ImagePathConstants.shareImage),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
