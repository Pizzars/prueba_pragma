import 'package:prueba_pragma/domain/models/cat_image_model.dart';

class CatModel {
  String id;
  String name;
  String cfaUrl;
  String vetStreetUrl;
  String vcaHospitalsUrl;
  String temperament;
  String origin;
  String countryCodes;
  String countryCode;
  String description;
  String lifeSpan;
  int indoor;
  int lap;
  String altNames;
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int sheddingLevel;
  int socialNeeds;
  int strangerFriendly;
  int vocalisation;
  int experimental;
  int hairless;
  int natural;
  int rare;
  int rex;
  int suppressedTail;
  int shortLegs;
  String wikipediaUrl;
  int hypoallergenic;
  String referenceImageId;
  Weight weight;

  CatImageModel? image;

  CatModel({
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetStreetUrl,
    required this.vcaHospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.weight,
    required this.image,
  });

  static List<CatModel> fromListMap(List<dynamic> list) => list.map((map) => CatModel.fromMap(map)).toList();

  factory CatModel.fromMap(Map<String, dynamic> map) => CatModel(
    id: map["id"] ?? '',
    name: map["name"] ?? '',
    cfaUrl: map["cfa_url"] ?? '',
    vetStreetUrl: map["vetstreet_url"] ?? '',
    vcaHospitalsUrl: map["vcahospitals_url"] ?? '',
    temperament: map["temperament"] ?? '',
    origin: map["origin"] ?? '',
    countryCodes: map["country_codes"] ?? '',
    countryCode: map["country_code"] ?? '',
    description: map["description"] ?? '',
    lifeSpan: map["life_span"] ?? '',
    indoor: map["indoor"] ?? 0,
    lap: map["lap"] ?? 0,
    altNames: map["alt_names"] ?? '',
    adaptability: map["adaptability"] ?? 0,
    affectionLevel: map["affection_level"] ?? 0,
    childFriendly: map["child_friendly"] ?? 0,
    dogFriendly: map["dog_friendly"] ?? 0,
    energyLevel: map["energy_level"] ?? 0,
    grooming: map["grooming"] ?? 0,
    healthIssues: map["health_issues"] ?? 0,
    intelligence: map["intelligence"] ?? 0,
    sheddingLevel: map["shedding_level"] ?? 0,
    socialNeeds: map["social_needs"] ?? 0,
    strangerFriendly: map["stranger_friendly"] ?? 0,
    vocalisation: map["vocalisation"] ?? 0,
    experimental: map["experimental"] ?? 0,
    hairless: map["hairless"] ?? 0,
    natural: map["natural"] ?? 0,
    rare: map["rare"] ?? 0,
    rex: map["rex"] ?? 0,
    suppressedTail: map["suppressed_tail"] ?? 0,
    shortLegs: map["short_legs"] ?? 0,
    wikipediaUrl: map["wikipedia_url"] ?? '',
    hypoallergenic: map["hypoallergenic"] ?? 0,
    referenceImageId: map["reference_image_id"] ?? '',
    weight: Weight.fromMap(map["weight"] ?? {}),
    image: null,
  );
}

class Weight {
  String imperial;
  String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromMap(Map<String, dynamic> map) => Weight(
    imperial: map["imperial"] ?? '',
    metric: map["metric"] ?? '',
  );
}