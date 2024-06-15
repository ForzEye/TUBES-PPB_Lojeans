import 'package:flutter/material.dart';
import 'package:lojeans_app/theme.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: titleText.copyWith(color: cPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 100,
            child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        "assets/${imageCategories[index]}",
                        width: 64,
                      ),
                      Text(
                        "${nameCategories[index]}",
                        style: regulerText.copyWith(fontSize: 12),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

List nameCategories = ["Best Sellers", "Totebag", "Pouch", "Slingbag"];
List imageCategories = ["best.png", "totebag.png", "pouch.png", "slingbag.png"];
