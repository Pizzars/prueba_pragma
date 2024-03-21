
import 'package:flutter/cupertino.dart';

class Responsive {

  final BuildContext context;
  Responsive(this.context);

  double screenWidth(){
    return MediaQuery.of(context).size.width;
  }
  double screenHeight(){
    return MediaQuery.of(context).size.height;
  }

  double width(double num){
    return MediaQuery.of(context).size.width * (num/100);
  }

  double height(double num){
    return MediaQuery.of(context).size.height * (num/100);
  }

}