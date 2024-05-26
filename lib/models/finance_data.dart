import 'package:cloud_firestore/cloud_firestore.dart';

class FinanceData {
  final String id;
  final String judul;
  final String jenisTransaksi;
  final String tanggal;
  final double nominal;
  final String catatan;

  FinanceData({
    required this.id,
    required this.judul,
    required this.jenisTransaksi,
    required this.tanggal,
    required this.nominal,
    required this.catatan,
  });

  factory FinanceData.fromDocument(DocumentSnapshot doc) {
    return FinanceData(
      id: doc.id,
      judul: doc['judul'],
      jenisTransaksi: doc['jenisTransaksi'],
      tanggal: doc['tanggal'],
      nominal: doc['nominal'],
      catatan: doc['catatan'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'judul': judul,
      'jenisTransaksi': jenisTransaksi,
      'tanggal': tanggal,
      'nominal': nominal,
      'catatan': catatan,
    };
  }
}
