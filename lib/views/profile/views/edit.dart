import 'package:flutter/material.dart';

class MyEditProfile extends StatefulWidget {
  const MyEditProfile({super.key});

  @override
  State<MyEditProfile> createState() => _MyEditProfileState();
}

class _MyEditProfileState extends State<MyEditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ListView(children: [
              Stack(children: [
                Positioned(
                  top: 10,
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width * 1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background/bg1.png'),
                          opacity: 0.5,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'My Profile',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: size.height * 0.15,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/content/img5.png'))),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Pak Bashori',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5E4437)),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 60,
                            width: size.width * 1,
                            child: TextField(
                              onChanged: (value) {
                                setState(
                                    () {}); // Update the state when text changes
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xff5E4437),
                                    fontWeight: FontWeight.normal),
                                hintText: "Bashori",
                                fillColor: Colors.white70,
                              ),
                            ),
                          ),
                          const Text(
                            'Nomor Telepon',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 60,
                            width: size.width * 1,
                            child: TextField(
                              enableSuggestions: false,
                              autocorrect: false,
                              onChanged: (value) {
                                setState(
                                    () {}); // Update the state when text changes
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xff5E4437),
                                    fontWeight: FontWeight.normal),
                                hintText: "0812312312",
                                fillColor: Colors.white70,
                              ),
                            ),
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 60,
                            width: size.width * 1,
                            child: TextField(
                              enableSuggestions: false,
                              autocorrect: false,
                              onChanged: (value) {
                                setState(
                                    () {}); // Update the state when text changes
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xff5E4437),
                                    fontWeight: FontWeight.normal),
                                hintText: "YANTOKAYANG",
                                fillColor: Colors.white70,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff674633),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: SizedBox(
                              height: size.height * 0.05,
                              width: size.width * 0.9,
                              child: const Center(
                                child: Text(
                                  'Simpan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.2,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ])
            ])));
  }
}
