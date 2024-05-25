import 'package:cloud_firestore/cloud_firestore.dart';

class PanenData {
  final String id;
  final String judul;
  final String jenisKopi;
  final String tanggalPanen;
  final int banyak;
  final String catatan;

  PanenData({
    required this.id,
    required this.judul,
    required this.jenisKopi,
    required this.tanggalPanen,
    required this.banyak,
    required this.catatan,
  });

  factory PanenData.fromDocument(DocumentSnapshot doc) {
    return PanenData(
      id: doc.id,
      judul: doc['judul'],
      jenisKopi: doc['jenisKopi'],
      tanggalPanen: doc['tanggalPanen'],
      banyak: doc['banyak'],
      catatan: doc['catatan'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'judul': judul,
      'jenisKopi': jenisKopi,
      'tanggalPanen': tanggalPanen,
      'banyak': banyak,
      'catatan': catatan,
    };
  }
}
