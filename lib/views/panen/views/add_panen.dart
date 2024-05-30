import 'package:flutter/material.dart';
import '../../../models/panen_data.dart';
import '../../../services/panen_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddPanen extends StatefulWidget {
  const AddPanen({super.key});

  @override
  State<AddPanen> createState() => _AddPanenState();
}

class _AddPanenState extends State<AddPanen> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _jenisKopiController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _banyakPanenController = TextEditingController();
  DateTime? _selectedDate;
  final PanenService _panenService = PanenService();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
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

  Future<void> _saveData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // If no user is logged in, show an error message and return
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in')),
      );
      return;
    }
    M_Panen newData = M_Panen(
      id: user.uid,
      judul: _judulController.text,
      jenisKopi: _jenisKopiController.text,
      tanggalPanen:
          '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}',
      banyak: int.tryParse(_banyakPanenController.text) ?? 0,
      catatan: _catatanController.text,
    );

    try {
      await _panenService.addPanenData(user.uid, newData);
      // ignore: use_build_context_synchronously
      Navigator.pop(context, newData);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Panen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Judul Pencatatan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _judulController,
              decoration: const InputDecoration(
                hintText: 'Masukkan judul pencatatan',
                border: OutlineInputBorder(),
              ),
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
              child: Text(
                _selectedDate != null
                    ? 'Pilih Tanggal: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Pilih Tanggal',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Banyak Panen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _banyakPanenController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Masukkan banyak panen',
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
                  _saveData();
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _judulController.dispose();
    _jenisKopiController.dispose();
    _banyakPanenController.dispose();
    _catatanController.dispose();
    super.dispose();
  }
}
