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
  final _formKey = GlobalKey<FormState>();
  final List<String> list = <String>[
    'Kadın',
    'Erkek',
    'Diğer',
    'Belirtmek İstemiyorum'
  ];

  String _currentAd = '';
  String _currentSoyad = '';
  String _currentYas = '';
  String _currentKilo = '';
  String _currentBoy = '';

  String dropdownValue = 'Belirtmek İstemiyorum';

  @override
  Widget build(BuildContext context) {
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

    return StreamBuilder<CurrenUserData>(
      stream: DatabaseService(uid: ref.watch(userUidProvider)).userData,
      builder: (context, snapshot) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringConstants.enterName,
                ),
                validator: (val) =>
                    val!.isEmpty ? StringConstants.enterName : null,
                onChanged: (val) => setState(() => _currentAd = val),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringConstants.enterSurname,
                ),
                validator: (val) =>
                    val!.isEmpty ? StringConstants.enterSurname : null,
                onChanged: (val) => setState(() => _currentSoyad = val),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringConstants.enterAge,
                ),
                validator: (val) =>
                    val!.isEmpty ? StringConstants.enterAge : null,
                onChanged: (val) => setState(() => _currentYas = val),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringConstants.enterWeight,
                ),
                validator: (val) =>
                    val!.isEmpty ? StringConstants.enterWeight : null,
                onChanged: (val) => setState(() => _currentKilo = val),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringConstants.enterHeight,
                ),
                validator: (val) =>
                    val!.isEmpty ? StringConstants.enterHeight : null,
                onChanged: (val) => setState(() => _currentBoy = val),
              ),
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
                  if (_formKey.currentState!.validate()) {
                    await DatabaseService(uid: ref.watch(userUidProvider))
                        .updateUserData(
                      _currentAd,
                      _currentBoy,
                      dropdownValue,
                      _currentKilo,
                      _currentSoyad,
                      _currentYas,
                    );
                  }
                },
                child: Text(
                  'Bilgileri Kaydet',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
