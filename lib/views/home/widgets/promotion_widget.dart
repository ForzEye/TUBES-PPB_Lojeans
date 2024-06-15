import 'package:flutter/material.dart';
import 'package:lojeans_app/theme.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Promotion",
            style: titleText.copyWith(color: cPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            "assets/banner2.png",
            height: 180,
          )
        ],
      ),
    );
  }
}
