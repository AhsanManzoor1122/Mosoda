import 'package:flutter/material.dart';

class LoadingSpinnerWidget extends StatefulWidget {
  const LoadingSpinnerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingSpinnerWidget> createState() => _LoadingSpinnerWidgetState();
}

class _LoadingSpinnerWidgetState extends State<LoadingSpinnerWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: _controller,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/barber.png"),
            ),
          ),
          const SizedBox(height: 10),
          Text("Loading..."),
        ],
      ),
    );
  }
}
