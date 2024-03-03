import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/utils/helpers/shared_pref.dart';
import 'package:fitness/views/view/onboarding_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'views/view/onboarding_screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool login=await SharedPref.getBool(key: "login");
  runApp(MyApp(login: login,));
}

class MyApp extends StatelessWidget {
  final bool login;
  const MyApp({super.key, required this.login});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: login?HomeScreen():LoginScreen(),
    );
  }
}
abstract class ShyWidget extends StatelessWidget {
  const ShyWidget({Key? key}) : super(key: key);
  Widget buildingView(BuildContext context, double h, double w);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: buildingView(context, h, w),);
  }
}

