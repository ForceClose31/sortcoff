import 'package:flutter/material.dart';
import 'package:sortcoff/views/home/views/homepage.dart';
import '../../../services/machine_services.dart'; // Import the service
import '../../../models/machine_data.dart';
import 'selsort.dart'; // Import the model

class MyMachineAct extends StatefulWidget {
  const MyMachineAct({super.key});

  @override
  State<MyMachineAct> createState() => _MyMachineActState();
}

class _MyMachineActState extends State<MyMachineAct> {
  final MachineService _machineService = MachineService();

  void _sendDataToFirebase(int value) async {
    MachineData data =
        MachineData(on: value, red: 0, blue: 0, green: 0, yellow: 0);
    await _machineService.sendDataToFirebase(data);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MySelSort()),
    );
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
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
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
                                    'assets/images/content/img1.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Pastikan aplikasi anda terhubung\ndengan mesin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _sendDataToFirebase(1);
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
                              'Aktifkan',
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
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xffBBB8B6),
                          ),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            alignment: Alignment.center,
                            child: const Text(
                              'Batalkan',
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
                            'Jika anda pilih lanjutkan, maka anda akan siap untuk memilah kopi berdasarkan warna dan ukuran biji kopi',
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
