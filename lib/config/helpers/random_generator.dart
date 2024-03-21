import 'dart:math';

class RandomGenerator {

  // static String getRandomName() {
  //   final randomNames = RandomNames(Zone.spain);
  //   return randomNames.fullName();
  // }

  static String generarID(int longitud) {
    const caracteres = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    var id = '';

    for (var i = 0; i < longitud; i++) {
      id += caracteres[random.nextInt(caracteres.length)];
    }

    return id;
  }

  // static Stream<String> randomNameStream() {
  //   return Stream.periodic(
  //       const Duration(seconds: 2), (i) => getRandomName()
  //   ).take(10);
  // }
}