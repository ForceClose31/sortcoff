import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/lc.dart';
import 'package:sortcoff/views/home/views/homepage.dart';
import 'package:sortcoff/views/keuangan/views/keuangan.dart';
import 'package:sortcoff/views/splash/views/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDtcJAoeqBXmxlsZsp048-XnKMDO8XQ70E',
    appId: '1:909574581057:android:c6805e5376cfa0f4b2cfc0',
    messagingSenderId: '909574581057',
    projectId: 'authshortcoff',
    storageBucket: 'authshortcoff.appspot.com',
  ));
  await AppTypoGraphy().loadFonts();
  await initializeDependencies();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShortCoff',
      home: const MyWelcome(),
      initialRoute: '/',
      routes: {
        '/Beranda' : (context) => const HomePage(),
        '/Keuangan' : (context) => const FinanceRecordingScreen(),
        '/Profil' : (context) => const HomePage(),

      },
    );
  }
}
