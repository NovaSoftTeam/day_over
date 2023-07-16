import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/models/current_user_model.dart';
import 'package:day_over/product/services/user_services/update_services/update_user_sevice.dart';
import 'package:day_over/product/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsForm extends ConsumerStatefulWidget {
  const SettingsForm({super.key});

  @override
  ConsumerState<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends ConsumerState<SettingsForm> {
  final List<String> list = <String>[
    'Kadın',
    'Erkek',
    'Diğer',
    'Belirtmek İstemiyorum'
  ];

  Future<void> editProfileInformation() async{
    bool isValid = _key.currentState!.validate();
    if (isValid) {
      _key.currentState!.save();
      await DatabaseService(uid: ref.watch(userUidProvider)).updateUserData(
          adController.text,
          boyController.text,
          dropdownValue,
          kiloController.text,
          soyadController.text,
          yasController.text);

      Navigator.of(context).pop();
    }
  }

  String dropdownValue = 'Belirtmek İstemiyorum';

  late final TextEditingController adController;
  late final TextEditingController soyadController;
  late final TextEditingController yasController;
  late final TextEditingController kiloController;
  late final TextEditingController boyController;
  late final GlobalKey<FormState> _key;

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
    return StreamBuilder<CurrenUserData>(
      stream: DatabaseService(uid: ref.watch(userUidProvider)).userData,
      builder: (context, snapshot) {
        return Form(
          key: _key,
          child: Column(
            children: [
              CustomFormField(
                  controller: adController,
                  labelText: StringConstants.enterName),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                  controller: soyadController,
                  labelText: StringConstants.enterSurname),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                  controller: yasController,
                  labelText: StringConstants.enterAge),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                  controller: kiloController,
                  labelText: StringConstants.enterWeight),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                  controller: boyController,
                  labelText: StringConstants.enterHeight,
                  keyBoardType: TextInputType.number),
              const SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                value: dropdownValue,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                items: list.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (val) =>
                    setState(() => dropdownValue = val.toString()),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  await editProfileInformation();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                ),
                child: const Text(
                  'Bilgileri Kaydet',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
