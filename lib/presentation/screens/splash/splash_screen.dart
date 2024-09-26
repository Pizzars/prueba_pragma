import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_pragma/config/config.dart';
import 'package:prueba_pragma/config/helpers/hero_tags.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/title_app.dart';

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

    // final user = await getUserPreferences();
    // final goHome = user != null;

    Future.delayed(const Duration(seconds: 5), (){
      // context.replace(goHome ? Routes.home : Routes.login);
      context.replace(Routes.home);
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
    return Scaffold(
      body: Container(
        height: responsive.screenHeight(),
        width: responsive.screenWidth(),
        decoration: const BoxDecoration(
          color: ColorsApp.primary300,
          image: DecorationImage(
            image: AssetImage('assets/images/general/cats.png'),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Hero(
            tag: HeroTags.logo,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: ColorsApp.secondary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)
              ),
              duration: const Duration(milliseconds: 500),
              width: responsive.width(size),
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/general/logo.png',
                      fit: BoxFit.contain,
                    ),
                    const Center(
                      child: TitleApp(text: "CatBreeds"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

