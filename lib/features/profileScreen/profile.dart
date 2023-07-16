import 'package:day_over/features/profileScreen/profile_edit.dart';
import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/services/user_services/update_services/update_user_sevice.dart';
import 'package:flutter/material.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  String _currentAd = '';
  String _currentSoyad = '';
  String _currentYas = '';
  String _currentKilo = '';
  String _currentBoy = '';
  String _currentCinsiyet = '';
  String _currentEmail = '';

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
    return StreamBuilder<CurrenUserData>(
        stream: DatabaseService(uid: ref.watch(userUidProvider)).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _currentAd = snapshot.data!.ad;
            _currentSoyad = snapshot.data!.soyad;
            _currentYas = snapshot.data!.yas;
            _currentKilo = snapshot.data!.kilo;
            _currentBoy = snapshot.data!.boy;
            _currentCinsiyet = snapshot.data!.cinsiyet;
            _currentEmail = (ref.watch(userIdentifierProvider));
            return SafeArea(
              child: Scaffold(
                drawer: const CustomDrawer(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomAppBar(appBarText: StringConstants.profil),
                      Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height / 2.7,
                          child: Column(
                            children: [
                              SizedBox(
                                height: containerHeight / 20,
                              ),
                              const CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                    'assets/informScreenImages/rick.png'),
                              ),
                              Text(
                                style: TextStyle(
                                  fontFamily: TextFontsConstants
                                      .glacialIndifferenceBold,
                                  fontSize: textSize,
                                ),
                                '${_currentAd} ${_currentSoyad}',
                              ),
                              Text(
                                style: TextStyle(
                                  fontFamily: TextFontsConstants
                                      .glacialIndifferenceRegular,
                                  fontSize: textSize / 1.5,
                                ),
                                '${_currentEmail}',
                              ),
                              SizedBox(
                                height: containerHeight / 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        style: TextStyle(
                                          fontFamily: TextFontsConstants
                                              .glacialIndifferenceRegular,
                                          fontSize: textSize / 1.5,
                                        ),
                                        '${StringConstants.age}: ${_currentYas}',
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
                                        '${StringConstants.height}:  ${_currentBoy}',
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
                                        '${StringConstants.weight}: ${_currentKilo}',
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
                                        '${StringConstants.gender}:  ${_currentCinsiyet}',
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileEdit(),
                                ),
                              );
                            },
                            title: Text(
                              StringConstants.editProfile,
                              style: TextStyle(
                                fontFamily:
                                    TextFontsConstants.glacialIndifferenceBold,
                                fontSize: textSize / 1.5,
                              ),
                            ),
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  ImagePathConstants.editProfileImage),
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
                              fontFamily: TextFontsConstants.poppinsMedium,
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
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Positioned(
                                                  left: -20,
                                                  top: -20,
                                                  child: InkResponse(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const CircleAvatar(
                                                      foregroundColor:
                                                          Colors.black,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Icon(
                                                          Icons.close_sharp),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  'assets/informScreenImages/DAYOVER.png'),
                                            ),
                                            Text(
                                              StringConstants.aboutUs,
                                              style: TextStyle(
                                                fontFamily: TextFontsConstants
                                                    .glacialIndifferenceBold,
                                                fontSize: textSize,
                                              ),
                                            ),
                                            SizedBox(
                                              height: containerHeight / 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1.0,
                                                      horizontal: 4.0),
                                              child: Card(
                                                child: ListTile(
                                                  onTap: () {},
                                                  title: Text(
                                                    style: TextStyle(
                                                      fontFamily: TextFontsConstants
                                                          .glacialIndifferenceBold,
                                                      fontSize: textSize / 2,
                                                    ),
                                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: containerHeight / 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1.0,
                                                      horizontal: 4.0),
                                              child: Card(
                                                child: ListTile(
                                                  onTap: () {},
                                                  title: Text(
                                                    style: TextStyle(
                                                      fontFamily: TextFontsConstants
                                                          .glacialIndifferenceBold,
                                                      fontSize: textSize / 2,
                                                    ),
                                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
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
                                    );
                                  });
                            },
                            title: Text(
                              StringConstants.aboutApp,
                              style: TextStyle(
                                fontFamily:
                                    TextFontsConstants.glacialIndifferenceBold,
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
                                fontFamily:
                                    TextFontsConstants.glacialIndifferenceBold,
                                fontSize: textSize / 1.5,
                              ),
                            ),
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/iconImages/uygulamayiOyla.png'),
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
                                  fontFamily: TextFontsConstants
                                      .glacialIndifferenceBold,
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
