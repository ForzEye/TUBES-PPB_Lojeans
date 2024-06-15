import 'package:flutter/material.dart';
import 'package:lojeans_app/theme.dart';

class DetailProductScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String desc;
  const DetailProductScreen(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.desc,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(
            Icons.shopping_cart_rounded,
            color: cGrey,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 8.0),
              child: Image.network(
                imageUrl,
                height: 358,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              name,
              style: titleText.copyWith(fontSize: 20, color: cPrimary),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                price,
                style: regulerText.copyWith(fontSize: 18),
              ),
            ),
            Text(
              desc,
              style: regulerText,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    backgroundColor: cLightGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Text(
                        "see all",
                        style:
                            regulerText.copyWith(fontSize: 14, color: cPrimary),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: cPrimary,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: cGrey.withOpacity(0.5)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            decoration: BoxDecoration(
              color: cLightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chat_rounded,
                  color: cDarkGrey,
                )),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: cLightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: titleText.copyWith(fontSize: 14, color: cPrimary),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: cDarkGrey),
              onPressed: () {},
              child: Text(
                "Add to Cart",
                style: titleText.copyWith(fontSize: 14, color: Colors.white),
              ))
        ]),
      ),
    ));
  }
}
