import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../value/colour.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2)); // Menunda tampilan SplashScreen selama 2 detik

    // Pindah ke halaman utama aplikasi
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorPallete.white,
      body:  Center(
        child: Container(
            decoration: BoxDecoration(
              color : ColorPallete.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 40, left: 40),
                    child: Image.asset(
                      "assets/images/logo.png",height: 150,
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
}
