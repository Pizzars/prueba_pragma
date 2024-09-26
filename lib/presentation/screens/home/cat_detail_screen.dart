import 'package:flutter/material.dart';
import 'package:prueba_pragma/config/config.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';
import 'package:prueba_pragma/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/title_small_app.dart';

class CatDetailScreen extends StatelessWidget {
  final CatModel cat;
  const CatDetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primary300,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8, right: 50),
          child: Center(
            child: TitleSmall(text: cat.name),
          ),
        ),
      ),
      backgroundColor: ColorsApp.tertiary,
      body: SizedBox(
        height: responsive.screenHeight(),
        width: responsive.screenWidth(),
        child: Stack(
          children: [
            SizedBox(
              height: responsive.screenHeight() / 2.5,
              width: responsive.screenWidth(),
              child: Image.network(cat.image?.url ?? '', fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: (responsive.screenHeight() / 1.9) + 32,
                width: responsive.screenWidth(),
                child: BaseScreen(
                  rounded: true,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
