import 'package:flutter/material.dart';

class ButtonMain extends StatefulWidget {
  final VoidCallback onTap;
  final Color textColor;
  final Widget child; // Customizable child widget
  final Icon? icon; // Optional icon
  final Color? buttonColor;
  // ignore: prefer_typing_uninitialized_variables
  final buttonBorderColor;
  const ButtonMain(
      {super.key,
      required this.child, // Provide any widget as a child (e.g., Text)

      required this.onTap,
      required this.textColor,
      this.icon,
      this.buttonColor,
      this.buttonBorderColor});

  @override
  // ignore: library_private_types_in_public_api
  _ButtonMainState createState() => _ButtonMainState();
}

class _ButtonMainState extends State<ButtonMain> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.07,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            // Button's background color
            border: Border.all(
              color: widget.buttonBorderColor
                  .withOpacity(0.1), // Shaded green border
              width: 4, // Border width
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: widget.icon,
                  ),
                // Check if the child is a Text widget and apply textColor
                if (widget.child is Text)
                  Text(
                    (widget.child as Text).data!,
                    style: TextStyle(color: widget.textColor),
                  )
                else
                  widget.child, // Otherwise, just display the child as it is
              ],
            ),
          ),
        ),
      ),
    );
  }
}
