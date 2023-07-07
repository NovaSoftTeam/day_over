import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.isObscureText,
      this.leadingIcon,
      this.suffixIcon,
      this.keyBoardType=TextInputType.text});

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool? isObscureText;
  final Icon? leadingIcon;
  final Icon? suffixIcon; 
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) {
        controller.text = newValue!;
      },
      validator: (value) {
        if (value == null || value.length < 8) {
          return "$value must not be empty or less than 8 charachters";
        }
      },
      obscureText: isObscureText == null ? false : isObscureText!,
      keyboardType: keyBoardType,
      controller: controller,
      decoration: InputDecoration(
          label: Text(labelText),
          hintText: hintText,
          prefixIcon: leadingIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
