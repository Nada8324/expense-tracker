import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/add_transaction/data/model/transaction_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatasource {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<User?> signUp({
    required String name,
    required String phone,
    required String gender,
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      await firestore.collection("users").doc(userCredential.user?.uid).set({
        "name": name,
        "gender": gender,
        "phone": phone,
        "email": email,
      });
    }
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

  Future<void> addTransaction(TransactionModel model) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await firestore
          .collection('users')
          .doc(user.uid)
          .collection("transactions")
          .add(model.toJson());
    }
  }
}
