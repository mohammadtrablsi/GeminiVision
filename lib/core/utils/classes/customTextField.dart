import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controlle, required this.hintText});
  final TextEditingController controlle;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlle,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(50)),
        hintText: hintText,
      ),
    );
  }
}
