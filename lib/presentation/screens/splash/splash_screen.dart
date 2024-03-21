import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_inlaze/config/config.dart';
import 'package:prueba_inlaze/config/helpers/hero_tags.dart';
import 'package:prueba_inlaze/data/user_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double size = 0;

  void _verificationUser() async {
    Future.delayed(Duration.zero, () {
      setState(() {
        size = 60;
      });}
    );

    final user = await getUserPreferences();
    final goHome = user != null;

    Future.delayed(const Duration(seconds: 1), (){
      context.replace(goHome ? Routes.home : Routes.login);
    });
  }

  @override
  void initState() {
    _verificationUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SizedBox(
      height: responsive.screenHeight(),
      width: responsive.screenWidth(),
      child: Center(
        child: Hero(
          tag: HeroTags.logo,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: responsive.width(size),
            child: Image.asset(
              'assets/images/general/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

