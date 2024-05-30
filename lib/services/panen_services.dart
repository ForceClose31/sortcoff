import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/panen_data.dart';

class PanenService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('panen');

  Future<List<M_Panen>> fetchPanenData(String userId) async {
    try {
      QuerySnapshot snapshot = await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .get();
      return snapshot.docs.map((doc) {
        return M_Panen.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> addPanenData(String userId, M_Panen panenData) async {
    try {
      await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .add(panenData.toDocument());
    } catch (e) {
      throw Exception('Failed to add data: $e');
    }
  }

  Future<void> updatePanenData(
      String userId, String id, M_Panen panenData) async {
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

  Future<void> updatePanenValues(String userId, String selectedJudul,
      int redValue, int yellowValue, int greenValue) async {
    try {
      QuerySnapshot snapshot = await _collectionReference
          .doc(userId)
          .collection('userPanenData')
          .where('judul', isEqualTo: selectedJudul)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference docRef = snapshot.docs.first.reference;
        await docRef.update({
          'red': redValue,
          'yellow': yellowValue,
          'green': greenValue,
        });
      } else {
        throw Exception('Document with judul $selectedJudul not found');
      }
    } catch (e) {
      throw Exception('Failed to update values: $e');
    }
  }
}
