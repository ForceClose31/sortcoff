import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import firebase_auth package

import 'machineact.dart';
import 'result.dart';

class MySelSort extends StatefulWidget {
  const MySelSort({super.key});

  @override
  State<MySelSort> createState() => _MySelSortState();
}

class _MySelSortState extends State<MySelSort> {
  String? selectedCoffee;
  List<String> coffeeTypes = [];

  @override
  void initState() {
    super.initState();
    _fetchCoffeeOptions();
  }

  void _fetchCoffeeOptions() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        CollectionReference userPanenDataRef = FirebaseFirestore.instance
            .collection('panen')
            .doc(userId)
            .collection('userPanenData');

        QuerySnapshot querySnapshot = await userPanenDataRef.get();

        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.forEach((DocumentSnapshot document) {
            String judul = document.get('judul');
            setState(() {
              coffeeTypes.add(judul);
            });
          });
        } else {
          setState(() {
            coffeeTypes = ['No Coffee Options Available'];
          });
        }
      }
    } catch (e) {
      // Error occurred while fetching data
      print('Error fetching coffee options: $e');
      setState(() {
        coffeeTypes = ['Error Fetching Coffee Options'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (coffeeTypes.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyMachineAct()),
              );
            },
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
                  onPressed: selectedCoffee != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HasilPage(
                                selectedJudul: selectedCoffee!,
                              ),
                            ),
                          );
                        }
                      : null,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
