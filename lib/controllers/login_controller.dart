import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/utils/helpers/shared_pref.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../views/view/onboarding_screens/home_screen.dart';
class LoginController extends GetxController{

  loginWithGoogle()async{
    var login=await signInWithGoogle();
    print("login==>$login");
    if(login!=null){
      await SharedPref.setBool(key: "login", data: true);
      Get.off(HomeScreen());
    }
  }
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      print("credential==>$credential");
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      print('exception->$e');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await SharedPref.setBool(key: "login", data: false);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}