import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mammal_diary/cubit/artikel_cubit.dart';
import 'package:mammal_diary/cubit/page_cubit.dart';
import 'package:mammal_diary/cubit/topmammal_cubit.dart';
import 'package:mammal_diary/ui/pages/get_started_page.dart';
import 'package:mammal_diary/ui/pages/main_page.dart';
import 'package:mammal_diary/ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => TopmammalCubit(),
        ),
        BlocProvider(
          create: (context) => ArtikelCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}
