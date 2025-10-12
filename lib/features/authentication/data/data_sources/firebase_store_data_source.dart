import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_cinema/features/authentication/data/models/user_account_model.dart';

class FirebaseStoreDataSource {
  FirebaseStoreDataSource({required this.firestore});

  final FirebaseFirestore firestore;

  Future<void> storeUserDetails(UserAccountModel user) async {
    log("storing user details in Firestore");
    try {
      await firestore.collection("users").doc(user.id).set({
        "email": user.email,
        "username": user.username,
        "avatarPath": user.avatarPath,
      });
    } catch (e) {
      log("Error storing user details: $e");
    }
  }

  Future<UserAccountModel?> getUserDetails(String id) async {
    try {
      final doc = await firestore.collection("users").doc(id).get();
      if (doc.exists && doc.data() != null) {
        return UserAccountModel(
          id: doc.id,
          email: doc.data()!['email'] ?? '',
          username: doc.data()!['username'] ?? '',
          avatarPath: doc.data()!['avatarPath'] ?? '',
        );
      }
      return null;
    } catch (e) {
      log("Error getting user details: $e");
      return null;
    }
  }
}
