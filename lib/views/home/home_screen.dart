import 'package:flutter/material.dart';
import 'package:lojeans_app/repositories/product_repo.dart';
import 'package:lojeans_app/views/home/product_screen.dart';
import 'package:lojeans_app/views/home/widgets/app_bar_widget.dart';
import 'package:lojeans_app/views/home/widgets/categories_widget.dart';
import 'package:lojeans_app/views/home/widgets/product_recommen_widget.dart';
import 'package:lojeans_app/views/home/widgets/promotion_widget.dart';
import 'package:lojeans_app/views/widgets/search_textfield.dart';

import '../../theme.dart';

class HomeScreen extends StatefulWidget {
  final String userEmail;
  const HomeScreen({super.key, required this.userEmail});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cIndex = 0;
  void init() {
    super.initState();
    ProductRepo().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(
              userEmail: widget.userEmail,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset("assets/banner1.png")),
            const CategoriesWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Product Recommendations",
                      style: titleText,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductScreen()));
                      },
                      child: Text(
                        "View all",
                        style: regulerText,
                      ))
                ],
              ),
            ),
            const ProductRecommenWidget(),
            const PromotionWidget()
          ],
        ),
      ),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(20.0),
      //     child: BottomNavigationBar(
      //         backgroundColor: Colors.amber,
      //         fixedColor: Colors.amber,
      //         items: const [
      //           BottomNavigationBarItem(
      //               icon: Icon(
      //                 Icons.home,
      //                 color: Colors.black,
      //               ),
      //               label: ""),
      //           BottomNavigationBarItem(
      //               icon: Icon(
      //                 Icons.checklist_sharp,
      //                 color: Colors.white,
      //               ),
      //               label: ""),
      //           BottomNavigationBarItem(
      //               icon: Icon(
      //                 Icons.favorite,
      //                 color: Colors.white,
      //               ),
      //               label: ""),
      //           BottomNavigationBarItem(
      //               icon: Icon(
      //                 Icons.person,
      //                 color: Colors.white,
      //               ),
      //               label: "")
      //         ]),
      //   ),
      // )
    ));
  }
}
