import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final  TextEditingController controller;
 const TextFieldWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Enter Label',
            suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  'label',
                  style: TextStyle(color: Colors.grey),
                )),
            filled: true,
            fillColor: const Color(0xffF6F8FA),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
