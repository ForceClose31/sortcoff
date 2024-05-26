import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/finance_data.dart';

class FinanceService {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('finance');

  Future<List<FinanceData>> fetchFinanceData(String userId) async {
    try {
      QuerySnapshot snapshot = await _collectionReference
          .doc(userId)
          .collection('userFinanceData')
          .get();
      return snapshot.docs.map((doc) {
        return FinanceData.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> addFinanceData(String userId, FinanceData financeData) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection('userFinanceData')
          .add(financeData.toDocument());
    } catch (e) {
      throw Exception('Failed to add data: $e');
    }
  }

  Future<void> updateFinanceData(String userId, FinanceData updatedFinanceData) async {
  try {
    await _collectionReference
        .doc(userId)
        .collection('userFinanceData')
        .doc(updatedFinanceData.id)
        .update(updatedFinanceData.toDocument());
  } catch (e) {
    throw Exception('Failed to update data: $e');
  }
}

}
