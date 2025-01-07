import 'package:flutter/material.dart';
import 'package:mosoda/globals.dart';
import 'package:mosoda/Model/categories.dart';
import 'package:mosoda/Resources/Components/button_widget.dart';
import 'package:mosoda/Resources/Components/theme_data.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/ViewModel/cat_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  var data = {
    "page": "",
  };

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cvm = Provider.of<CartViewModel>(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/laundry.png"),
                      fit: BoxFit.cover)),
            ),
            FutureBuilder<Catetgories>(
                future: cvm.categories(data, context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error in fetch Data"),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Data Available"),
                    );
                  } else {
                    var categoryList = snapshot.data!.data.categories;
                    return Expanded(
                      flex: 7,
                      child: GridView.builder(
                        scrollDirection: isLandscape
                            ? Axis.vertical
                            : Axis
                                .horizontal, // Set direction based on orientation
                        itemCount: categoryList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLandscape
                              ? 3
                              : 2, // Change number of columns based on orientation
                          crossAxisSpacing: screenWidth * 0.05,
                          mainAxisSpacing: screenHeight * 0.02,
                        ),
                        itemBuilder: (context, index) {
                          ValueNotifier<bool> isHovered = ValueNotifier(false);

                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.subCategory,
                                  arguments: {'catId': categoryList[index].id});
                            },
                            child: ValueListenableBuilder<bool>(
                              valueListenable: isHovered,
                              builder: (context, hovered, child) {
                                return MouseRegion(
                                  onEnter: (_) => isHovered.value = true,
                                  onExit: (_) => isHovered.value = false,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      color: hovered
                                          ? Colors.blue.withOpacity(0.1)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: hovered
                                          ? [
                                              BoxShadow(
                                                color: Colors.blueAccent
                                                    .withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: const Offset(0, 4),
                                              )
                                            ]
                                          : [],
                                    ),
                                    child: Card(
                                      elevation: hovered ? 5 : 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    categoryList[index].image,
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()), // Placeholder while loading
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              categoryList[index].title,
                                              style: TextStyle(
                                                fontWeight: hovered
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: hovered
                                                    ? Colors.blue
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
            const Spacer(),
            ButtonMain(
                buttonBorderColor: AppTheme.fillColor,
                buttonColor: AppTheme.buttonColor,
                onTap: () async {
                  Globals.userToken = "";
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  await pref.setString('token', "");
                  Globals.userToken = "";
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, RoutesName.addlocation);
                },
                textColor: Colors.white,
                child: const Text("next"))
          ],
        ),
      ),
    );
  }
}
