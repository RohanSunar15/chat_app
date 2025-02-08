import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC2E96A),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash logo.png",
              scale: 2,
            ),
            Text("Tasktugas" ,
            style: TextStyle(
              color: Color(0xFF1F5737),
              fontSize: 40,
              decoration: TextDecoration.none
            ),
            ),
          ],
        ),
      ),
    );
  }
}
