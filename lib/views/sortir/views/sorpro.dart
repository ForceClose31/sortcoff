import 'package:flutter/material.dart';
import 'selsort.dart';

class MySorPro extends StatefulWidget {
  const MySorPro({super.key});

  @override
  State<MySorPro> createState() => _MySorProState();
}

class _MySorProState extends State<MySorPro> {
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
                              'Menunggu',
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
                              'Batal',
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
