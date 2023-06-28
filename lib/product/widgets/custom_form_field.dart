import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.isObscureText,
      this.icon});

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool? isObscureText;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) {
        controller.text = newValue!;
      },
      validator: (value) {
        if(value == null || value.length < 8){
          return "$value must not be empty or less than 8 charachters";
        }
      },
      obscureText: isObscureText == null ? false : isObscureText!,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          label: Text(labelText),
          hintText: hintText,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            )),
    );
  }
}
