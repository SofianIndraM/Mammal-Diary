import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mammal_diary/cubit/page_cubit.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:mammal_diary/ui/pages/home_page.dart';
import 'package:mammal_diary/ui/pages/tentang_page.dart';
import 'package:mammal_diary/ui/widgets/custom_bottom_navigation_item.dart';

import 'artikel_page.dart';
import 'kamera_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return KameraPage();
        case 2:
          return ArtikelPage();
        case 3:
          return TentangPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
                title: 'Home',
              ),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_kamera.png',
                title: 'Kamera',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_artikel.png',
                title: 'Artikel',
              ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_tentang.png',
                title: 'Tentang',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
