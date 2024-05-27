import 'package:firebase_database/firebase_database.dart';

import '../models/machine_data.dart';

class MachineService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Future<void> sendDataToFirebase(int value) async {
    await _databaseReference.child('test').set({
      'on': value,
      'red': 0,
      'blue': 0,
      'green': 0,
      'yellow': 0,
    });
  }

  Stream<MachineData> getMachineData() {
    return _databaseReference.child('test').onValue.map((event) {
      final data = event.snapshot.value as Map<String, dynamic>?;
      if (data != null) {
        return MachineData.fromMap(data);
      } else {
        throw 'Data is null or not in the correct format';
      }
    });
  }
}
