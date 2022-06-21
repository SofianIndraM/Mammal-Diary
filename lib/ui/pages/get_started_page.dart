import 'package:flutter/material.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:mammal_diary/ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/get_started.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Temukanlah Rasa Penasaranmu',
                      style: whiteTextStyle.copyWith(
                        fontSize: 28,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Jelajahi berbagai jenis mamalia di sekitar Anda dan penuhi rasa ingin tahu Anda',
                      style: whiteTextStyle.copyWith(
                        fontWeight: light,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomButton(
                      title: 'Get Started',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/main', (route) => false);
                      },
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 80,
                      ),
                      width: 220,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
