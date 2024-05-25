import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/panen_data.dart';

class PanenService {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('panen');

  Future<List<PanenData>> fetchPanenData(String userId) async {
    try {
      QuerySnapshot snapshot = await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .get();
      return snapshot.docs.map((doc) {
        return PanenData.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> addPanenData(String userId, PanenData panenData) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .add(panenData.toDocument());
    } catch (e) {
      throw Exception('Failed to add data: $e');
    }
  }

  Future<void> updatePanenData(String userId, String id, PanenData panenData) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .doc(id)
          .update(panenData.toDocument());
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }
}
