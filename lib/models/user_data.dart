import 'package:cloud_firestore/cloud_firestore.dart';

class M_DataAkun {
  final String uid;
  final String name;
  final String phoneNumber;

  M_DataAkun({
    required this.uid,
    required this.name,
    required this.phoneNumber,
  });

  factory M_DataAkun.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return M_DataAkun(
      uid: doc.id,
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
