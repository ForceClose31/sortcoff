import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/home_data.dart';

class HomeServices {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('panen');

  Future<List<HomeData>> fetchHomeData(String userId) async {
    try {
      QuerySnapshot snapshot = await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .get();
      return snapshot.docs.map((doc) {
        return HomeData.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
