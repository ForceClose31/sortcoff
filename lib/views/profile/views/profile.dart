import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/profile/profile_bloc.dart';
import '../../../bloc/profile/profile_event.dart';
import '../../../bloc/profile/profile_state.dart';
import '../../../global/widgets/navbar.dart';
import '../../../services/user_services.dart';
import 'edit.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc(UserService())..add(LoadUserProfile());
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: size.width * 0.7,
                                child: const Column(
                                  children: [
                                    Text(
                                      'My Profile',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.1,
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyEditProfile()),
                                        );
                                      },
                                    ),
                                    const Text('edit')
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
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
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 50,
                                  width: size.width,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    state.email,
                                    style: const TextStyle(
                                      color: Color(0xff674633),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Nama',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 50,
                                  width: size.width,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    state.userProfile.name,
                                    style: const TextStyle(
                                      color: Color(0xff674633),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 50,
                                  width: size.width,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    state.userProfile.phoneNumber,
                                    style: const TextStyle(
                                      color: Color(0xff674633),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 50,
                                  width: size.width,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text(
                                    '*********',
                                    style: TextStyle(
                                      color: Color(0xff674633),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    _profileBloc.add(LogOutUser());
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
                                        'Log Out',
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
                      ),
                    ],
                  )
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
      bottomNavigationBar: const Navigasi(),
    );
  }
}
