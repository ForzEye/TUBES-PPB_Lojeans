import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final _auth = FirebaseAuth.instance;

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Mendapatkan objek User dari userCredential
      User? user = userCredential.user;

      // Memeriksa apakah user tidak null
      if (user != null) {
        // Mengembalikan email pengguna yang sedang login
        return user.email!;
      } else {
        // Jika user null, kembalikan null
        return "";
      }
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something wrong!';
    } catch (e) {
      throw e;
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something wrong!';
    } catch (e) {
      throw e;
    }
  }
}
