import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sortcoff/models/panen_data.dart';

class DetailPanen extends StatelessWidget {
  final M_Panen panenData;

  const DetailPanen({super.key, required this.panenData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${panenData.judul}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jenis Kopi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              panenData.jenisKopi,
              style: const TextStyle(color: Colors.brown, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tanggal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '28',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(
                      text: panenData.tanggalPanen.split('-')[0],
                    ),
                    readOnly: true, // Make text field read-only
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '07',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(
                      text: panenData.tanggalPanen.split('-')[1],
                    ),
                    readOnly: true, // Make text field read-only
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '2023',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(
                      text: panenData.tanggalPanen.split('-')[2],
                    ),
                    readOnly: true, // Make text field read-only
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Banyak',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${panenData.banyak}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Kg',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Catatan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Catatan',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              controller: TextEditingController(text: panenData.catatan),
              readOnly: true, // Make text field read-only
            ),
            const SizedBox(height: 24),
            const Text(
              'Hasil Pemilahan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            _buildSortingResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildSortingResult() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('panen')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('userPanenData')
          .doc(panenData.id)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        var data = snapshot.data!.data() as Map<String, dynamic>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSortingChip('M', Colors.red, data['red'] ?? 0),
                _buildSortingChip('K', Colors.yellow, data['yellow'] ?? 0),
                _buildSortingChip('H', Colors.green, data['green'] ?? 0),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildSortingChip(String label, Color color, int quantity) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 8),
        Text('$quantity'),
      ],
    );
  }
}
