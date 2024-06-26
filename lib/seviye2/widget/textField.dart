// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool numberKeyboard;
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.numberKeyboard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType:
            numberKeyboard ? TextInputType.number : TextInputType.multiline,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(labelText)),
      ),
    );
  }
}
