import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createUser(String email, String password, String username) async {
    FirebaseFirestore.instance.collection("users").add({
      "email": email,
      "password": password,
      "username": username,
    });
  }
