import 'package:flutter/material.dart';
import 'package:new_sironi/homepage.dart';
import 'package:new_sironi/contactus.dart';
import 'package:new_sironi/menu.dart';
import 'package:new_sironi/ourstory.dart';
import 'package:new_sironi/reviews.dart';
import 'package:new_sironi/splashcreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sironi',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const Splashscreen()
    );
  }
}