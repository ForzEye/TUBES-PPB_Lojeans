import 'package:flutter/material.dart';
import 'package:lojeans_app/repositories/auth_repo.dart';
import 'package:lojeans_app/theme.dart';
import 'package:lojeans_app/views/auth/login_screen.dart';
import 'package:lojeans_app/views/widgets/search_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              "Create Acount",
              style: titleText.copyWith(color: cPrimary, fontSize: 24),
            ),
            Text(
              "Sign up",
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
                      await _repo.register(
                          email: emailEdc.text, password: passEdc.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                      // Jika login berhasil, tampilkan Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Berhasil membuat akun",
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
                            "Terjadi kesalahan",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "DAFTAR",
                    style: titleText.copyWith(color: Colors.white),
                  )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun? ",
                    style: regulerText,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Login"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
