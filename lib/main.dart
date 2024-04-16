import 'package:demo_app/screen/welcome_screen.dart';
import 'package:demo_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
// import 'package:login_signup/screens/welcome_screen.dart';
// import 'package:login_signup/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //means dynamic data aa bhi skta hai ja bhi skta hai
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}