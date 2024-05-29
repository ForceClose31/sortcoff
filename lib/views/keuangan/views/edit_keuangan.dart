import 'package:flutter/material.dart';
import '../../../models/finance_data.dart'; // Rename PanenData to FinanceData

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Finance'), // Change title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Judul Catatan Finance', // Change title
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _judulController,
              decoration: const InputDecoration(
                hintText: 'Masukkan judul catatan finance', // Change hint text
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  FinanceData editedData = FinanceData(
                    id: widget.financeData.id,
                    judul: _judulController.text,
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
    _judulController.dispose();
    super.dispose();
  }
}
