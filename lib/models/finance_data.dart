import 'package:cloud_firestore/cloud_firestore.dart';

class M_PencatatanKeuangan {
  final String id;
  final String judul;
  final String jenisTransaksi;
  final String tanggal;
  final double nominal;
  final String catatan;

  M_PencatatanKeuangan({
    required this.judul,
    required this.id,
    this.jenisTransaksi = '',
    this.tanggal = '',
    this.nominal = 0,
    this.catatan = '',
  });

  factory M_PencatatanKeuangan.fromDocument(DocumentSnapshot doc) {
    return M_PencatatanKeuangan(
      id: doc.id,
      judul: doc['judul'],
      jenisTransaksi: doc['jenisTransaksi'],
      tanggal: doc['tanggal'] ?? 0,
      nominal: doc['nominal'] ?? 0,
      catatan: doc['catatan'] ?? 0,
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
