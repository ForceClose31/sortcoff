import 'package:flutter/material.dart';
import 'panen.dart';

class EditPanen extends StatefulWidget {
  final PanenData panenData;

  const EditPanen({Key? key, required this.panenData}) : super(key: key);

  @override
  State<EditPanen> createState() => _EditPanenState();
}

class _EditPanenState extends State<EditPanen> {
  TextEditingController _jenisKopiController = TextEditingController();
  TextEditingController _banyakController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  DateTime? _selectedDate; // Variabel untuk menyimpan tanggal yang dipilih
  int _banyakPanen = 0;
  @override
  void initState() {
    super.initState();
    _jenisKopiController.text =
        widget.panenData.jenisKopi; // Parse tanggal ke DateTime
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green, // Warna primary untuk kalender
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Panen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tanggal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text(_selectedDate != null
                  ? 'Pilih Tanggal: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                  : 'Pilih Tanggal'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jumlah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_banyakPanen > 0) {
                        _banyakPanen--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  'Banyak: $_banyakPanen',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _banyakPanen++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Jenis Kopi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _jenisKopiController,
              decoration: const InputDecoration(
                hintText: 'Masukkan jenis kopi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Catatan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _catatanController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Masukkan catatan (opsional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  PanenData editedData = PanenData(
                    judul: widget.panenData.judul,
                    jenisKopi: _jenisKopiController.text,
                    tanggalPanen: _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : '',
                  );
                  Navigator.pop(context, editedData);
                },
                child: const Text('Simpan Perubahan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _jenisKopiController.dispose();
    _banyakController.dispose();
    _catatanController.dispose();
    super.dispose();
  }
}
