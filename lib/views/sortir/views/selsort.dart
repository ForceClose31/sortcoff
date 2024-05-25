import 'package:flutter/material.dart';
import 'sorpro.dart';

class MySelSort extends StatefulWidget {
  const MySelSort({super.key});

  @override
  State<MySelSort> createState() => _MySelSortState();
}

class _MySelSortState extends State<MySelSort> {
  String? selectedCoffee;
  List<String> coffeeTypes = ['option 1', 'option 2', 'option 3'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: const Text('PEMILIHAN KOPI'),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: size.width * 1,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: const Text(
                    'Data Panen',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownMenu<String>(
                    menuHeight: 200,
                    width: size.width * 0.9,
                    initialSelection: selectedCoffee ?? coffeeTypes.first,
                    onSelected: (String? value) {
                      setState(() {
                        selectedCoffee = value;
                      });
                    },
                    dropdownMenuEntries: coffeeTypes
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4,
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MySorPro()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color(0xff5E4437),
                  ),
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: const Center(
                      child: Text(
                        'Lanjutkan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: const BorderSide(color: Color(0xff5E4437), width: 2),
                    backgroundColor: Colors.white,
                  ),
                  child: SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: const Center(
                      child: Text(
                        'Batal',
                        style: TextStyle(
                          color: Color(0xff5E4437),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                // Add more widgets here as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MySelSort());
}
