import 'package:cloud_firestore/cloud_firestore.dart';

class HomeData {
  final String judul;
  final String catatan;
  final int banyak;

  HomeData({
    required this.judul,
    required this.catatan,
    required this.banyak,
  });

  factory HomeData.fromDocument(DocumentSnapshot doc) {
    return HomeData(
      judul: doc['judul'],
      catatan: doc['catatan'],
      banyak: doc['banyak'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'judul': judul,
      'catatan': catatan,
      'banyak': banyak,
    };
  }
}
