import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'category_page.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              enableDrag: false,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              constraints: BoxConstraints(
                maxHeight: height * 0.8,
                minHeight: height * 0.8,
              ),
              context: context,
              builder: (context) {
                return CategoryPage(category: category, height: height);
              });
        },
        child: GlassContainer(
          height: height * 0.08,
          blur: 5,
          color: Colors.white.withOpacity(0.5),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.5),
              const Color.fromARGB(255, 208, 216, 236).withOpacity(0.9),
            ],
          ),
          border: const Border.fromBorderSide(BorderSide.none),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
