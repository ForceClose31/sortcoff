import 'package:flutter/material.dart';
import 'package:sortcoff/models/finance_data.dart';

class DetailFinance extends StatelessWidget {
  final M_PencatatanKeuangan financeData;

  const DetailFinance({super.key, required this.financeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${financeData.judul}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Judul Pencatatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              financeData.judul,
              style: const TextStyle(color: Colors.brown),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jenis Transaksi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              financeData.jenisTransaksi,
              style: const TextStyle(color: Colors.brown),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tanggal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              financeData.tanggal,
              style: const TextStyle(color: Colors.brown),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nominal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              financeData.nominal.toString(),
              style: const TextStyle(color: Colors.brown),
            ),
            const SizedBox(height: 16),
            const Text(
              'Catatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              financeData.catatan,
              style: const TextStyle(color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
