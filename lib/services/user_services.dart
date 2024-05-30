// services/user_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_data.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<M_DataAkun?> getUserProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot doc =
            await _firestore.collection('users').doc(user.uid).get();
        if (doc.exists) {
          return M_DataAkun.fromFirestore(doc);
        }
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
    return null;
  }

  Future<void> updateUserProfile(M_DataAkun userProfile) async {
    try {
      await _firestore
          .collection('users')
          .doc(userProfile.uid)
          .update(userProfile.toMap());
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
