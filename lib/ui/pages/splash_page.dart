import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mammal_diary/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/get-started', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_monkey.png',
                  ),
                ),
              ),
            ),
            Text(
              'MAMMAL\nDIARY',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
                letterSpacing: 10,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
