import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resq_cat_club/core/const.dart';
import 'package:resq_cat_club/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppConsts.theme, home: const HomeScreen());
  }
}
