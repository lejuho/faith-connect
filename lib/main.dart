import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import './screen/bible_study_app.dart';
import './screen/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bible Study App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: BibleStudyApp(),
    );
  }
}

