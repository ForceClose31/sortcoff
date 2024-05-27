import 'package:cloud_firestore/cloud_firestore.dart';

class PanenData {
  final String id;
  final String judul;
  final String jenisKopi;
  final String tanggalPanen;
  final int banyak;
  final String catatan;
  final int red;
  final int yellow;
  final int green;

  PanenData({
    required this.id,
    required this.judul,
    required this.jenisKopi,
    required this.tanggalPanen,
    required this.banyak,
    required this.catatan,
    this.red = 0,
    this.yellow = 0,
    this.green = 0,
  });

  factory PanenData.fromDocument(DocumentSnapshot doc) {
    return PanenData(
      id: doc.id,
      judul: doc['judul'],
      jenisKopi: doc['jenisKopi'],
      tanggalPanen: doc['tanggalPanen'],
      banyak: doc['banyak'],
      catatan: doc['catatan'],
      red: doc['red'] ?? 0,
      yellow: doc['yellow'] ?? 0,
      green: doc['green'] ?? 0,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'judul': judul,
      'jenisKopi': jenisKopi,
      'tanggalPanen': tanggalPanen,
      'banyak': banyak,
      'catatan': catatan,
      'red': red,
      'yellow': yellow,
      'green': green,
    };
  }
}
