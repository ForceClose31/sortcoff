import 'package:flutter/material.dart';
import '../../../models/finance_data.dart';

class EditFinance extends StatefulWidget {
  final FinanceData financeData;

  const EditFinance({super.key, required this.financeData});

  @override
  State<EditFinance> createState() => _EditFinanceState();
}

class _EditFinanceState extends State<EditFinance> {
  final TextEditingController _judulController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _judulController.text = widget.financeData.judul;
  }

  void _saveData() {
    // Check if the text field is empty
    if (_judulController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan Data dengan Benar')),
      );
      return;
    }

    final RegExp symbolRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (symbolRegExp.hasMatch(_judulController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan Data dengan Benar')),
      );
      return;
    }

    FinanceData editedData = FinanceData(
      id: widget.financeData.id,
      judul: _judulController.text,
      jenisTransaksi: widget.financeData.jenisTransaksi,
      tanggal: widget.financeData.tanggal,
      nominal: widget.financeData.nominal,
      catatan: widget.financeData.catatan,
    );

    Navigator.pop(context, editedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Finance'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Judul Catatan Finance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _judulController,
              decoration: const InputDecoration(
                hintText: 'Masukkan judul catatan finance',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: ElevatedButton(
                onPressed: _saveData,
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
    _judulController.dispose();
    super.dispose();
  }
}
