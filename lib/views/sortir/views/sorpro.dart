import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../models/machine_data.dart';
import 'selsort.dart';
import '../../../services/machine_services.dart'; // Import the service

class MySorPro extends StatefulWidget {
  const MySorPro({super.key});

  @override
  State<MySorPro> createState() => _MySorProState();
}

class _MySorProState extends State<MySorPro> {
  // ignore: deprecated_member_use
  final DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
  int _blueValue = 0;
  int _redValue = 0;
  int _yellowValue = 0;
  int _greenValue = 0;

  void initState() {
    super.initState();

    // Listen for red, yellow, and green values
    _dbRef.child('test').child('red').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        setState(() {
          _redValue = value;
        });
      }
    });

    _dbRef.child('test').child('yellow').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        setState(() {
          _yellowValue = value;
        });
      }
    });

    _dbRef.child('test').child('green').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is int) {
        setState(() {
          _greenValue = value;
        });
      }
    });
  }

  final MachineService _machineService = MachineService();

  void _sendDataToFirebase(int value) async {
    MachineData data = MachineData(
        on: value,
        blue: 10,
        green: _greenValue,
        red: _redValue,
        yellow: _yellowValue);
    await _machineService.sendDataToFirebase(data);
  }

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySelSort()),
                    );
                  }),
              title: const Text('PEMILIHAN KOPI'),
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Positioned(
                  top: -100,
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width * 1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background/bg1.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          height: size.height * 0.4,
                          width: size.width * 0.8,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/content/img4.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Biji kopi anda sedang dalam proses\npemilahan oleh mesin SortCoff',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _sendDataToFirebase(0);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xff5E4437),
                          ),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            alignment: Alignment.center,
                            child: const Text(
                              'Selesaikan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: size.width * 0.7,
                          child: const Text(
                            'Jika anda pilih selesaikan, maka anda akan siap untuk memilah kopi berdasarkan warna dan ukuran biji kopi',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )));
  }
}
