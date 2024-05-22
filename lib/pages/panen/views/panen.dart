import 'package:flutter/material.dart';
import 'add_panen.dart';
import 'edit_panen.dart'; // Tambahkan import untuk halaman EditPanen

class PanenKopi extends StatefulWidget {
  const PanenKopi({super.key});

  @override
  State<PanenKopi> createState() => _PanenKopiState();
}

class _PanenKopiState extends State<PanenKopi> {
  List<PanenData> panenList = [];

  void _tambahDataPanen(PanenData newData) {
    setState(() {
      panenList.add(newData);
    });
  }

  void _editDataPanen(PanenData editedData, int index) {
    setState(() {
      panenList[index] = editedData;
    });
  }

  void _buildCard(BuildContext context, int index) {
    // Menambahkan logika navigasi ke halaman edit
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPanen(panenData: panenList[index]),
      ),
    ).then((editedData) {
      if (editedData != null && editedData is PanenData) {
        _editDataPanen(editedData, index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Data Hasil Panen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: panenList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/content/img1.png', // Ubah dengan path foto kopi
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              panenList[index].judul,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Kopi: ${panenList[index].jenisKopi}'),
                            Text('Tanggal: ${panenList[index].tanggalPanen}'),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Panggil fungsi _buildCard ketika tombol edit ditekan
                        _buildCard(context, index);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPanen()),
          );
          if (result != null && result is PanenData) {
            _tambahDataPanen(result);
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class PanenData {
  final String judul;
  final String jenisKopi;
  final String tanggalPanen;

  PanenData({
    required this.judul,
    required this.jenisKopi,
    required this.tanggalPanen,
  });
}
