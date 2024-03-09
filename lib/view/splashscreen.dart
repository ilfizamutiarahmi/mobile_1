import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mobile_1/view/searchkosakata.dart';
import 'package:mobile_1/view/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigateToListKosakata);
  }

  void navigateToListKosakata() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Replace with your desired color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/book.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                'Selamat Datang Kamus Mandarin!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
