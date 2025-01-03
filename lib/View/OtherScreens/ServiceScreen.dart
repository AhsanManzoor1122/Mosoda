import 'package:flutter/material.dart';
import 'package:mosoda/ViewModel/cat_view_model.dart';
import 'package:provider/provider.dart';

class Servicescreen extends StatefulWidget {
  const Servicescreen({super.key});

  @override
  State<Servicescreen> createState() => _ServicescreenState();
}

class _ServicescreenState extends State<Servicescreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimation;

  void services() {
    var service = Provider.of<CartViewModel>(context, listen: false);
    Map<String, dynamic> data = {'sub_cat_id': 56};
    service.service(data);
  }

  @override
  void initState() {
    super.initState();
    // Future.microtask(() {
    //   services();
    // });
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _fadeAnimation = List.generate(10, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(index / 10, (index + 1) / 10, curve: Curves.easeIn)));
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Services"),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ScaleTransition(
                        scale: _controller,
                        //  opacity: _fadeAnimation[index],
                        child: DecoratedBoxTransition(
                          decoration: _controller.drive(
                            DecorationTween(
                              begin: BoxDecoration(color: Colors.red),
                              end: BoxDecoration(color: Colors.yellow),
                            ),
                          ),
                          // duration: Duration(seconds: 2),
                          // color: Colors.red,
                          // margin: const EdgeInsets.all(10),
                          // height: 100,
                          child: Image.asset("assets/laundry.png"),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
