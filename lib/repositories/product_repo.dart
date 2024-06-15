import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('products').get();
      print(querySnapshot);
      List<Map<String, dynamic>> products = querySnapshot.docs
          .map((doc) => {
                'description': doc['description'],
                'image_url': doc['image_url'],
                'name': doc['name'],
                'price': doc['price'],
                'rating': doc['rating'],
                'size': doc['size'],
                'stock': doc['stock'],
              })
          .toList();
      return products;
    } catch (e) {
      print('ERROR: $e');
      throw e;
    }
  }
}
