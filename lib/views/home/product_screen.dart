import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojeans_app/theme.dart';

import '../widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Product",
          style: titleText,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    String price = NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp',
                    ).format(snapshot.data!.docs[index]['price']);
                    print("DATA: ${snapshot.data!.docs[index]["image_url"]}");
                    return ProductCard(
                      desc: snapshot.data!.docs[index]['description'],
                      imageUrl: snapshot.data!.docs[index]['image_url'],
                      name: snapshot.data!.docs[index]['name'],
                      price: price,
                    );
                  });
            }
          }),
    ));
  }
}
