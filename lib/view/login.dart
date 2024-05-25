import 'package:flutter/material.dart';
import 'package:sortcoff/view/welcome.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _showPassword = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isTextFieldFilled() {
    return _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
            Stack(
              children: [
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
                Positioned(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: size.height * 0.45,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/content/img3.png'))),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: () {
                               Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyWelcome()),
                              );

                            }),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.35,
                    ),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: size.width * 1,
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
                              controller: _usernameController,
                              onChanged: (value) {
                                setState(
                                    () {}); // Update the state when text changes
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xff5E4437),
                                    fontWeight: FontWeight.normal),
                                hintText: "Enter your username",
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
                              controller: _passwordController,
                              obscureText: !_showPassword,
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
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color(0xff5E4437),
                                    fontWeight: FontWeight.normal),
                                hintText: "Enter your password",
                                fillColor: Colors.white70,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _showPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _showPassword = value!;
                                  });
                                },
                              ),
                              const Text('Show Password')
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: _isTextFieldFilled() ? () {} : null,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: _isTextFieldFilled()
                                  ? const Color(0xff5E4437)
                                  : const Color(0xffBBB8B6),
                            ),
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.9,
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
                          SizedBox(
                            height: size.height * 0.2,
                          ),
                        ],
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
