import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lojeans_app/repositories/product_repo.dart';
import 'package:lojeans_app/theme.dart';
import 'package:lojeans_app/views/auth/login_screen.dart';

class AppBarWidget extends StatelessWidget {
  final String userEmail;
  const AppBarWidget({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: cPrimary,
          child: const Icon(
            Icons.person,
            color: Colors.white,
          )),
      title: Text(
        "Good morning",
        style: regulerText.copyWith(fontSize: 12, color: cGrey),
      ),
      subtitle: Text(userEmail,
          style: regulerBoldText.copyWith(fontSize: 12, color: cPrimary)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              ProductRepo().getProducts();
            },
            icon: Icon(
              Icons.shopping_cart,
              color: cPrimary,
            ),
          ),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(
                Icons.logout,
                color: cPrimary,
              ))
        ],
      ),
    );
  }
}
