import 'package:flutter/material.dart';
import 'package:mosoda/Model/sub_categories.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/ViewModel/cat_view_model.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Subcategoryscreen extends StatefulWidget {
  final int catid;

  const Subcategoryscreen({super.key, required this.catid});

  @override
  State<Subcategoryscreen> createState() => _SubcategoryscreenState();
}

class _SubcategoryscreenState extends State<Subcategoryscreen>
    with SingleTickerProviderStateMixin {
  var color = Colors.blue;
  var secondcolor = Colors.blue;
  bool _isInitialized = false;
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<double>> _scaleAnimations;
  List<SubCategoriesData> subcategories = [];
  int? _selectedIndex; // Track the selected index

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // Fetch subcategories
      Map<String, dynamic> map = {'cat_id': widget.catid.toString()};
      Provider.of<CartViewModel>(context, listen: false)
          .subCategories(map)
          .then((response) {
        // ignore: unnecessary_null_comparison
        if (response != null) {
          setState(() {
            subcategories = response.data.subcategories;

            // Initialize animations with staggered delays
            _fadeAnimations = List.generate(
              subcategories.length,
              (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    0.5 * index / subcategories.length,
                    (index + 1) / subcategories.length,
                    curve: Curves.easeIn,
                  ),
                ),
              ),
            );

            _scaleAnimations = List.generate(
              subcategories.length,
              (index) => Tween<double>(begin: 0.5, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Interval(
                    0.5 *
                        index /
                        subcategories.length, // Stagger delay per container
                    (index + 1) / subcategories.length,
                    curve: Curves.easeOutBack,
                  ),
                ),
              ),
            );

            // Start the animation
            _controller.forward();
          });
        }
      });

      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subcategory Screen')),
      body: subcategories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemCount: subcategories.length,
              itemBuilder: (context, index) {
                final subcategory = subcategories[index];
                return AnimatedBuilder(
                  animation: _fadeAnimations[index],
                  builder: (context, child) {
                    // Set the color for the selected item, else default color
                    var selectedColor =
                        _selectedIndex == index ? Colors.amber : Colors.blue;
                    var selectedSecondColor =
                        _selectedIndex == index ? Colors.red : Colors.blue;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          Navigator.pushNamed(context, RoutesName.service);
                        });
                      },
                      child: Opacity(
                        opacity: _fadeAnimations[index].value,
                        child: Transform.scale(
                          scale: _scaleAnimations[index].value,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  selectedColor,
                                  selectedSecondColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(25, 50, 28, 0.259),
                                  blurRadius: 6,
                                  offset: Offset(3, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: subcategory.image != null
                                        ? CachedNetworkImage(
                                            imageUrl: subcategory.image,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(
                                              Icons.image_not_supported,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.image_not_supported,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    subcategory.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
