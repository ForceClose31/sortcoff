import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'sorpro.dart';

class HasilPage extends StatefulWidget {
  const HasilPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HasilPageState createState() => _HasilPageState();
}

class _HasilPageState extends State<HasilPage> {
  // ignore: deprecated_member_use
  final DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
  int _blueValue = 0;

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
              _buildResultRow('Biji Warna Merah', 400, 400, 400),
              const SizedBox(height: 8),
              _buildResultRow('Biji Warna Kuning', 400, 400, 400),
              const SizedBox(height: 8),
              _buildResultRow('Biji Warna Hijau', 400, 400, 400),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Selesaikan'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildResultRow(String color, int large, int medium, int small) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(color),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildResultDetail('L', large),
            _buildResultDetail('M', medium),
            _buildResultDetail('S', small),
          ],
        ),
      ],
    );
  }

  Widget _buildResultDetail(String size, int value) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: size == 'L'
              ? Colors.red
              : (size == 'M' ? Colors.yellow : Colors.green),
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
    return const Scaffold(
      body: MySorPro()
    );
  }
}
