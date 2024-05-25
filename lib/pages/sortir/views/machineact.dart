import 'package:flutter/material.dart';

class MyMachineAct extends StatefulWidget {
  const MyMachineAct({super.key});

  @override
  State<MyMachineAct> createState() => _MyMachineActState();
}

class _MyMachineActState extends State<MyMachineAct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'PEMILIHAN KOPI',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    Container(
                      height: size.height * 0.4,
                      width: size.width * 0.8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/content/img1.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Pastikan aplikasi anda terhubung\ndengan mesin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Tindakan yang akan dilakukan saat tombol ditekan
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tindakan yang akan dilakukan saat tombol ditekan
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
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
        ),
      ),
    );
  }
}
