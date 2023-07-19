import 'package:day_over/features/profile/update_user_widget.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_over/features/sign_up/sign_viev_model.dart';

class ProfileEdit extends ConsumerStatefulWidget {
  const ProfileEdit({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileEditState();
}

class _ProfileEditState extends ConsumerState<ProfileEdit> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadUrl;
  //image picker
  Future imagePickerMethod() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        //showing a snackbar with error message
        showSnackBar('No image selected', Duration(milliseconds: 400));
      }
    });
  }

  //uploading image to firebase storage
  Future uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference refImage = FirebaseStorage.instance
        .ref()
        .child('${ref.watch(userUidProvider)}/profileImages')
        .child('post_$postID');
    await refImage.putFile(_image!);
    downloadUrl = await refImage.getDownloadURL();
    await firebaseFirestore
        .collection('users')
        .doc(ref.watch(userUidProvider))
        .collection('images')
        .doc('profileImage')
        .set({'downloadURL': downloadUrl});
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(ref.watch(userUidProvider))
                            .collection('images')
                            .snapshots(),
                        builder: (context, snapshot) {
                          return RawMaterialButton(
                            onPressed: () {
                              imagePickerMethod();
                              if (_image != null) {
                                uploadImage().whenComplete(() => showSnackBar(
                                    'Image upload successfully :',
                                    Duration(seconds: 2)));
                              } else {
                                showSnackBar('Select Image First',
                                    Duration(milliseconds: 400));
                              }
                            },
                            elevation: 2.0,
                            shape: const CircleBorder(),
                            child: CircleAvatar(
                              backgroundImage: _image == null
                                  ? snapshot.hasData == true
                                      ? snapshot.data!.docs.isEmpty == true
                                          ? AssetImage(
                                              'assets/informScreenImages/rick.png')
                                          : NetworkImage(snapshot.data!.docs[0]
                                                  ['downloadURL'] as String)
                                              as ImageProvider<Object>?
                                      : AssetImage(
                                          'assets/informScreenImages/rick.png')
                                  : FileImage(_image!) as ImageProvider,
                              radius: 80,
                            ),
                          );
                        }),
                    TextButton(
                      onPressed: () {
                        imagePickerMethod();
                      },
                      child: const Text(StringConstants.editProfileImageText),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_image != null) {
                          uploadImage().whenComplete(() => showSnackBar(
                              'Image upload successfully :',
                              Duration(seconds: 2)));
                        } else {
                          showSnackBar('Select Image First',
                              Duration(milliseconds: 400));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[800]),
                      ),
                      child: const Text(
                        'Fotoğrafı Kaydet',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
