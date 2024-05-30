import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/finance_data.dart';

class FinanceService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('finance');

  Future<List<M_PencatatanKeuangan>> fetchFinanceData(String userId) async {
    try {
      QuerySnapshot snapshot = await _collectionReference
          .doc(userId)
          .collection('userFinanceData')
          .get();
      return snapshot.docs.map((doc) {
        return M_PencatatanKeuangan.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> addFinanceData(
      String userId, M_PencatatanKeuangan financeData) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection('userFinanceData')
          .add(financeData.toDocument());
    } catch (e) {
      throw Exception('Failed to add data: $e');
    }
  }

  Future<void> updateFinanceData(
      String userId, M_PencatatanKeuangan updatedFinanceData) async {
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
