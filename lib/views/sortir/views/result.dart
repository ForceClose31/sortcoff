import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import firebase_auth package
import 'package:sortcoff/views/home/views/homepage.dart';
import 'sorpro.dart';
import '../../../services/panen_services.dart'; // Import PanenService

class HasilPage extends StatefulWidget {
  final String selectedJudul;
  const HasilPage({super.key, required this.selectedJudul});

  @override
  // ignore: library_private_types_in_public_api
  _HasilPageState createState() => _HasilPageState();
}

class _HasilPageState extends State<HasilPage> {
  // ignore: deprecated_member_use
  final DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
  int _blueValue = 0;
  int _redValue = 0;
  int _yellowValue = 0;
  int _greenValue = 0;

  @override
  void initState() {
    super.initState();
    _dbRef.child('test').child('blue').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        final int newBlueValue = value;
        setState(() {
          _blueValue = newBlueValue;
        });
        if (_blueValue == 10) {
          _showResultPopup();
        }
      }
    });

    // Listen for red, yellow, and green values
    _dbRef.child('test').child('red').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        setState(() {
          _redValue = value;
          _updateFirestore();
        });
      }
    });

    _dbRef.child('test').child('yellow').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        setState(() {
          _yellowValue = value;
          _updateFirestore();
        });
      }
    });

    _dbRef.child('test').child('green').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        setState(() {
          _greenValue = value;
          _updateFirestore();
        });
      }
    });
  }

  void _updateFirestore() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await PanenService().updatePanenValues(
          userId,
          widget.selectedJudul,
          _redValue,
          _yellowValue,
          _greenValue,
        );
      }
    } catch (e) {
      print('Error updating Firestore: $e');
    }
  }

  void _showResultPopup() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Hasil Pemilahan',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildResultRow(_redValue, _yellowValue, _greenValue),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Selesaikan'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildResultRow(int merah, int kuning, int hijau) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildResultDetail('M', merah),
            _buildResultDetail('K', kuning),
            _buildResultDetail('H', hijau),
          ],
        ),
      ],
    );
  }

  Widget _buildResultDetail(String size, int value) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: size == 'M'
              ? Colors.red
              : (size == 'K' ? Colors.yellow : Colors.green),
          radius: 10,
          child: Text(size,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(width: 8),
        Text(value.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MySorPro());
  }
}
