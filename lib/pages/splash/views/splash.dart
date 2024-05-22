import 'package:flutter/material.dart';
// import 'package:sortcoff/pages/home/views/home.dart';
import 'package:sortcoff/pages/signin/views/signin.dart';
import 'package:sortcoff/pages/signup/views/signup.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff5E4437),
        body: Stack(
          children: [
            Positioned(
              top: 0,
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
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 103),
                      height: size.height * 0.3,
                      width: size.width * 1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/content/img2.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 500,
                      width: size.height * 1,
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            'Selamat Datang di SortCoff',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'zzzzzzzzzzzzzzzzzzzzzzz\nxxxxxxxxxxxxxxxxxxxxxxxxxxx\nyyyyyyyyyyyyyyyyyy',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SigninPage()),
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
                                  'Login',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              side: const BorderSide(
                                  color: Color(0xff5E4437), width: 2),
                              backgroundColor: Colors.white,
                            ),
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.8,
                              child: const Center(
                                child: Text(
                                  'Sign Up',
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
                    ),
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
