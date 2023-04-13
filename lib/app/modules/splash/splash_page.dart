import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user == null){
        Modular.to.navigate('/login');
      }else {
        Modular.to.navigate('/home');
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppConfigUi.theme.primaryColor,
        ),
        child: Center(
          child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/Logo.png')),
        ),
      ),
    );
  }
}
