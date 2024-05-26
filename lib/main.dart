import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/bloc/navigation/navigation_bloc.dart';
import 'package:sortcoff/bloc/navigation/navigation_state.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/lc.dart';
import 'package:sortcoff/views/splash/views/splash.dart';

import 'views/home/views/homepage.dart';
import 'views/profile/views/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDtcJAoeqBXmxlsZsp048-XnKMDO8XQ70E',
          appId: '1:909574581057:android:c6805e5376cfa0f4b2cfc0',
          messagingSenderId: '909574581057',
          projectId: 'authshortcoff',
          storageBucket: 'authshortcoff.appspot.com',
          databaseURL: 'https://authshortcoff-default-rtdb.firebaseio.com/'));
  await AppTypoGraphy().loadFonts();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShortCoff',
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is HomePageState) {
          return const HomePage();
        } else if (state is ProfilePageState) {
          return const MyProfile();
        }
        return const MyWelcome();
      },
    );
  }
}
