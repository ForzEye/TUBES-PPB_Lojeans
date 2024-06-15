import 'package:flutter/material.dart';
import 'package:lojeans_app/repositories/auth_repo.dart';
import 'package:lojeans_app/theme.dart';
import 'package:lojeans_app/views/auth/register_screen.dart';
import 'package:lojeans_app/views/home/home_screen.dart';
import 'package:lojeans_app/views/widgets/search_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = true;
  final AuthRepo _repo = AuthRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOJEANS",
              style: titleText.copyWith(color: cPrimary, fontSize: 70),
            ),
            Text(
              "Welcome Back",
              style: titleText.copyWith(color: cPrimary, fontSize: 24),
            ),
            Text(
              "Sign in to continue",
              style: regulerText.copyWith(color: cPrimary),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "E-mail",
              style: regulerBoldText.copyWith(color: cPrimary),
            ),
            CustomTextField(
              controller: emailEdc,
              icon: Icon(
                Icons.email,
                color: cGrey,
              ),
              hintText: "Masukan e-mail anda",
            ),
            Text(
              "Password",
              style: regulerBoldText.copyWith(color: cPrimary),
            ),
            CustomTextField(
              controller: passEdc,
              icon: Icon(
                Icons.key,
                color: cGrey,
              ),
              hintText: "Masukan password anda",
              obsecure: true,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: cPrimary),
                  onPressed: () async {
                    try {
                      String userEmail = await _repo.login(
                          email: emailEdc.text, password: passEdc.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  userEmail: userEmail,
                                )),
                      );
                      // Jika login berhasil, tampilkan Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Login successful!",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } catch (e) {
                      // Jika login gagal, tampilkan Snackbar dengan pesan kesalahan
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Gagal login, password atau email salah",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: titleText.copyWith(color: Colors.white),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun? ",
                    style: regulerText,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text("Sign Up"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
