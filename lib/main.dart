import 'package:clipper_pro/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clipper_pro/splash_screen.dart';
import 'package:clipper_pro/onboarding_screen.dart';
import 'package:clipper_pro/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Display the splash screen initially
      routes: {
        '/onboarding': (context) => const OnboardingScreen(), // Route for the onboarding screens
        '/home': (context) => const HomeScreen(), // Route for the home screen
        '/signup': (context) => const SignupScreen(), // Route for the signup screen
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnboardingScreen(); // Update the method call to navigate to the onboarding screens
  }

  Future<void> navigateToOnboardingScreen() async {
    await Future.delayed(const Duration(seconds: 2)); // Set the duration for the splash screen

    Navigator.of(context).pushReplacementNamed('/onboarding'); // Navigate to the onboarding screens
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ClipperPro',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
