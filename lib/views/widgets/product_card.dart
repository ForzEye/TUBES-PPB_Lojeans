import 'package:flutter/material.dart';
import 'package:lojeans_app/theme.dart';
import 'package:lojeans_app/views/product/detail_product_screen.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String desc;
  const ProductCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.desc,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProductScreen(
                    imageUrl: imageUrl,
                    name: name,
                    desc: desc,
                    price: price,
                  ))),
      child: Container(
        margin: const EdgeInsets.only(left: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: cGrey.withOpacity(0.2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              // "https://static.wikia.nocookie.net/naruto/images/7/70/Naruto_newshot.jpg/revision/latest/scale-to-width-down/1200?cb=20141107130405&path-prefix=id",
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                    height: 138,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image));
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                name,
                style: titleText.copyWith(
                  color: cPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 5),
              child: Text(
                price,
                style: regulerText.copyWith(color: cGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
