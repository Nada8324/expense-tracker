import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatasource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User?> login({required String email, required String password}) async {
    final userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> forgetpassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
