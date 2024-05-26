import 'package:flutter/material.dart';
import '../../../models/finance_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddFinance extends StatefulWidget {
  const AddFinance({super.key});

  @override
  State<AddFinance> createState() => _AddFinanceState();
}

class _AddFinanceState extends State<AddFinance> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _nominalController =
      TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedTransactionType = 'Pemasukan';
  final List<String> _transactionTypes = ['Pemasukan', 'Pengeluaran'];

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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in')),
      );
      return;
    }
    FinanceData newData = FinanceData(
      id: user.uid,
      judul: _judulController.text,
      tanggal: _selectedDate != null
          ? '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}'
          : '',
      nominal: double.parse(
          _nominalController.text), 
      jenisTransaksi: _selectedTransactionType,
      catatan: _catatanController.text,
    );

    try {
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
        title: const Text('Tambah Data Keuangan'),
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
              'Jenis Transaksi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: _selectedTransactionType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTransactionType = newValue!;
                });
              },
              items: _transactionTypes
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nominal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _nominalController, 
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Masukkan nominal',
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
    _nominalController.dispose(); 
    _catatanController.dispose();
    super.dispose();
  }
}
