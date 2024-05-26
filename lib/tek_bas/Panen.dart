import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Panen extends StatefulWidget {
  @override
  _HarvestResultPageState createState() => _HarvestResultPageState();
}

class _HarvestResultPageState extends State<Panen> {
  int quantity = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Panen 1'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit button press
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(child: Text('Edit')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jenis Kopi', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Kopi Robusta', style: TextStyle(color: Colors.brown)),
            SizedBox(height: 16),
            Text('Tanggal', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '28',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '07',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '2023',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Banyak', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.brown),
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) quantity--;
                    });
                  },
                ),
                Text('$quantity',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.brown),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
                Text('Kg', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 16),
            Text('Catatan', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText:
                    'Kopi ini dari lahan yang berlokasi di sumbersari.\nblalalallalalala',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 24),
            Text('Hasil Pemilahan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 16),
            _buildSortingResult('Biji Warna Merah'),
            _buildSortingResult('Biji Warna Kuning'),
            _buildSortingResult('Biji Warna Hijau'),
          ],
        ),
      ),
    );
  }

  Widget _buildSortingResult(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSortingChip('L', Colors.red, 400),
            _buildSortingChip('M', Colors.yellow, 400),
            _buildSortingChip('S', Colors.green, 400),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSortingChip(String label, Color color, int quantity) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(width: 8),
        Text('$quantity'),
      ],
    );
  }
}
