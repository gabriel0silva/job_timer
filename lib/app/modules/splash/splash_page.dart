import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Modular.get<AuthService>().signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(const Duration(seconds: 5))
            .then((_) => Modular.to.navigate('/login'));
      } else {
        Future.delayed(const Duration(seconds: 5))
            .then((_) => Modular.to.navigate('/home'));
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
                  height: 140,
                  width: 140,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36)),
                      child: Lottie.asset("assets/lottie/ampulheta.json"))),
        ),
      ),
    );
  }
}
