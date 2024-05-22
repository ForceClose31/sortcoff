import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/lc.dart';
// import 'package:sortcoff/pages/panen/views/panen.dart';
// import 'package:sortcoff/pages/home/views/homepage.dart';
import 'package:sortcoff/pages/splash/views/splash.dart';
// import 'package:sortcoff/pages/splash/views/splash.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task app',
      home: MyWelcome(),
    );
  }
}
