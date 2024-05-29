import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../services/user_services.dart';
import '../../../bloc/profile/profile_bloc.dart';
import '../../../bloc/profile/profile_event.dart';
import '../../../bloc/profile/profile_state.dart';
import 'profile.dart'; // Sesuaikan dengan import yang sesuai dengan halaman profil Anda

class MyEditProfile extends StatefulWidget {
  const MyEditProfile({Key? key}) : super(key: key);

  @override
  State<MyEditProfile> createState() => _MyEditProfileState();
}

class _MyEditProfileState extends State<MyEditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc(UserService());
    _profileBloc.add(LoadUserProfile());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _profileBloc.close();
    super.dispose();
  }

  // Fungsi untuk mengganti password di Firebase Auth
  void changePassword(String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        print('Password updated successfully!');
      } else {
        print('User not signed in.');
      }
    } catch (e) {
      print('Error updating password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (_) => _profileBloc,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return ListView(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 10,
                        child: Container(
                          height: size.height * 0.5,
                          width: size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/background/bg1.png'),
                              opacity: 0.5,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Edit Profile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
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
                                    'assets/images/content/img5.png'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            state.userProfile.name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5E4437),
                            ),
                          ),
                          const SizedBox(height: 70),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 60,
                                  width: size.width,
                                  child: TextField(
                                    controller: _nameController,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Color(0xff5E4437),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hintText: state.userProfile.name,
                                      fillColor: Colors.white70,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 60,
                                  width: size.width,
                                  child: TextField(
                                    controller: _phoneNumberController,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Color(0xff5E4437),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hintText: state.userProfile.phoneNumber,
                                      fillColor: Colors.white70,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 60,
                                  width: size.width,
                                  child: TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Color(0xff5E4437),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hintText: "Password",
                                      fillColor: Colors.white70,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    final String name =
                                        _nameController.text.trim();
                                    final String phoneNumber =
                                        _phoneNumberController.text.trim();
                                    final String currentName =
                                        state.userProfile.name;
                                    final String currentPhoneNumber =
                                        state.userProfile.phoneNumber;
                                    final String newPassword =
                                        _passwordController.text.trim();

                                    // Mengisi data kosong dengan data sebelumnya
                                    final String updatedName =
                                        name.isNotEmpty ? name : currentName;
                                    final String updatedPhoneNumber =
                                        phoneNumber.isNotEmpty
                                            ? phoneNumber
                                            : currentPhoneNumber;

                                    if (name != currentName ||
                                        phoneNumber != currentPhoneNumber) {
                                      _profileBloc.add(UpdateUserProfile(
                                          updatedName, updatedPhoneNumber));
                                    }

                                    if (newPassword.isNotEmpty) {
                                      changePassword(newPassword);
                                    }

                                    // Setelah berhasil disimpan, kembali ke halaman profil
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyProfile()),
                                    );
                                  },
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
                                SizedBox(height: size.height * 0.2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
