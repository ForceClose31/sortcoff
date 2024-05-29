import 'package:firebase_database/firebase_database.dart';
import '../models/machine_data.dart'; // Ensure the import path is correct

class MachineService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Future<void> sendDataToFirebase(MachineData data) async {
    try {
      await _databaseReference.child('test').set(data.toJson());
      print('Data sent successfully');
    } catch (e) {
      print('Failed to send data: $e');
    }
  }
}
