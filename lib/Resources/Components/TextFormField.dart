import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  final TextInputType? inputType;
  final String? hintText, labelText;
  final TextEditingController textEditingController;
  final IconButton? iconButton;
  final IconButton? prefixIcon;
  final Color? fillColor;
  final bool obsecure;

  const TextformfieldWidget({
    this.hintText,
    this.labelText,
    required this.textEditingController,
    this.iconButton,
    this.fillColor,
    this.obsecure = false,
    this.inputType,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
          top: screenHeight * 0.005,
          bottom: screenHeight * 0.005),
      child: Container(
        width: double.infinity, // Set width here
        height: 60, // Set height here
        child: TextFormField(
          keyboardType: inputType,
          obscureText: obsecure,
          controller: textEditingController,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            suffixIcon: iconButton,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black26),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20, // Adjust vertical padding to increase height
            ),
          ),
        ),
      ),
    );
  }
}
