import 'package:flutter/material.dart';
import 'package:prueba_pragma/config/config.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';
import 'package:prueba_pragma/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/TextApp.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/title_small_app.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: SizedBox(
                height: (responsive.screenHeight() / 1.9) + 32,
                width: responsive.screenWidth(),
                child: BaseScreen(
                  rounded: true,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContentInfo(title: "Description", value: cat.description),
                        ContentInfo(title: "Origin", value: cat.origin),
                        ContentInfo(title: "Temperament", value: cat.temperament),
                        ContentInfo(title: "Life Span", value: cat.lifeSpan),
                        ContentInfo(title: "Indoor", value: cat.indoor == 1 ? "Yes" : "No"),
                        ContentInfo(title: "Lap Cat", value: cat.lap == 1 ? "Yes" : "No"),
                        ContentInfo(title: "Adaptability", value: cat.adaptability.toString()),
                        ContentInfo(title: "Affection Level", value: cat.affectionLevel.toString()),
                        ContentInfo(title: "Child Friendly", value: cat.childFriendly.toString()),
                        ContentInfo(title: "Dog Friendly", value: cat.dogFriendly.toString()),
                        ContentInfo(title: "Energy Level", value: cat.energyLevel.toString()),
                        ContentInfo(title: "Grooming", value: cat.grooming.toString()),
                        ContentInfo(title: "Health Issues", value: cat.healthIssues.toString()),
                        ContentInfo(title: "Intelligence", value: cat.intelligence.toString()),
                        ContentInfo(title: "Shedding Level", value: cat.sheddingLevel.toString()),
                        ContentInfo(title: "Social Needs", value: cat.socialNeeds.toString()),
                        ContentInfo(title: "Stranger Friendly", value: cat.strangerFriendly.toString()),
                        ContentInfo(title: "Vocalisation", value: cat.vocalisation.toString()),
                        ContentInfo(title: "Hypoallergenic", value: cat.hypoallergenic == 1 ? "Yes" : "No"),

                        // Links
                        LinkInfo(title: "Wikipedia", url: cat.wikipediaUrl),
                        LinkInfo(title: "CFA URL", url: cat.cfaUrl),
                        LinkInfo(title: "Vetstreet URL", url: cat.vetStreetUrl),
                        LinkInfo(title: "VCA Hospitals URL", url: cat.vcaHospitalsUrl),
                      ],
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

class ContentInfo extends StatelessWidget {
  final String title;
  final String value;

  const ContentInfo({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSmall(text: title,),
          TextApp(text: value),
        ],
      ),
    );
  }
}

class LinkInfo extends StatelessWidget {
  final String title;
  final String url;

  const LinkInfo({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir el enlace: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSmall(text: title,),
          GestureDetector(
            onTap: _launchUrl,
            child: TextApp(text: url, color: ColorsApp.primary,),
          ),
        ],
      ),
    );
  }
}

