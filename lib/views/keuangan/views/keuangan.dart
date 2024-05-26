import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const FinanceRecordingScreen(),
    );
  }
}

class FinanceRecordingScreen extends StatefulWidget {
  const FinanceRecordingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FinanceRecordingScreenState createState() => _FinanceRecordingScreenState();
}

class _FinanceRecordingScreenState extends State<FinanceRecordingScreen> {
  String selectedCategory = 'Pengeluaran';

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Pencatatan Keuangan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryButton(
                  label: 'Pemasukan',
                  selected: selectedCategory == 'Pemasukan',
                  onTap: () => _onCategorySelected('Pemasukan'),
                ),
                CategoryButton(
                  label: 'Pengeluaran',
                  selected: selectedCategory == 'Pengeluaran',
                  onTap: () => _onCategorySelected('Pengeluaran'),
                ),
                CategoryButton(
                  label: 'All',
                  selected: selectedCategory == 'All',
                  onTap: () => _onCategorySelected('All'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                FinanceItem(
                  title: 'Beli Pupuk',
                  subtitle: 'Pupuk ABC',
                  date: '28 Jul 2023',
                  type: 'Pengeluaran',
                ),
                FinanceItem(
                  title: 'Bayar Pekerja',
                  subtitle: 'Sebanyak 10',
                  date: '1 Des 2024',
                  type: 'Pengeluaran',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryButton({super.key, 
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.brown : Colors.grey[300],
        foregroundColor: selected ? Colors.white : Colors.black,
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}

class FinanceItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String type;

  const FinanceItem({super.key, 
    required this.title,
    required this.subtitle,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage:
              AssetImage('assets/coffee.jpg'), // Replace with your asset image
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              type,
              style: const TextStyle(color: Colors.red),
            ),
            Text(date),
          ],
        ),
      ),
    );
  }
}
