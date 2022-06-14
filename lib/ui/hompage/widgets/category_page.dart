import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:vesta/ui/hompage/controller/home_controller.dart';
import 'package:vesta/ui/hompage/widgets/popular_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, required this.category, required this.height})
      : super(key: key);
  final String category;
  final double height;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    var categoryChannels = homeController.channels
        .where((element) => element.categories.contains(category))
        .toList();

    var width = MediaQuery.of(context).size.width;
    return GlassContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      height: height * 0.8,
      width: width,
      blur: 5,
      color: Colors.white.withOpacity(0.8),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.9),
        ],
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GridView.builder(
            itemCount: categoryChannels.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PopularWidget(channel: categoryChannels[index]);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
