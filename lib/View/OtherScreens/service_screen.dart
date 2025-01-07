import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mosoda/Model/service.dart';
import 'package:mosoda/ViewModel/cat_view_model.dart';
import 'package:provider/provider.dart';

class Servicescreen extends StatefulWidget {
  final int subCatId;
  const Servicescreen({super.key, required this.subCatId});

  @override
  State<Servicescreen> createState() => _ServicescreenState();
}

class _ServicescreenState extends State<Servicescreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _decorationAnimation;
  List<Services> serviceList = [];
  bool isLoading = true; // To handle loading state
  bool hasError = false; // To handle errors
  bool checkbox = false;
  void services() async {
    try {
      var service = Provider.of<CartViewModel>(context, listen: false);
      Map<String, dynamic> data = {'sub_cat_id': widget.subCatId.toString()};
      var response = await service.service(data);
      setState(() {
        serviceList = response.data?.services ?? [];
        isLoading = false;
        if (serviceList.isNotEmpty) {
          _controller.forward(); // Start animation after fetching data
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      services();
    });

    // Initialize animation
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _decorationAnimation = DecorationTween(
      begin: const BoxDecoration(color: Colors.red),
      end: const BoxDecoration(color: Colors.white54),
    ).animate(_controller);
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
        backgroundColor: const Color.fromARGB(246, 223, 220, 220),
        title: const Text("Services"),
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : hasError
                ? const Center(child: Text("Failed to load services"))
                : serviceList.isEmpty
                    ? const Center(child: Text("No services available"))
                    : ListView.builder(
                        itemCount: serviceList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ScaleTransition(
                              scale: _controller,
                              child: DecoratedBoxTransition(
                                decoration: _decorationAnimation,
                                child: Container(
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              height: screenHeight * 0.1,
                                              width: screenHeight * 0.1,
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  serviceList[index].image!,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          Text(serviceList[index].arTitle!),
                                          Checkbox(
                                              value: true,
                                              onChanged: (bool? val) {
                                                setState(() {
                                                  checkbox = val!;
                                                });
                                              })
                                        ],
                                      ),
                                      // Text(
                                      //   serviceList[index].title ?? "Service",
                                      //   style: const TextStyle(
                                      //     fontSize: 18,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      // const SizedBox(height: 5),
                                      // Text(serviceList[index].description ??
                                      //     "No description"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
      ),
    );
  }
}
