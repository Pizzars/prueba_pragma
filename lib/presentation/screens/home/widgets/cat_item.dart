import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/config/config.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';
import 'package:prueba_pragma/presentation/screens/home/cat_detail_screen.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/TextApp.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/title_small_app.dart';

// import '../../../blocs/cats/cats_cubit.dart';

class CatItem extends StatefulWidget {
  const CatItem({super.key, required this.cat});

  final CatModel cat;

  @override
  State<CatItem> createState() => _CatItemState();
}

class _CatItemState extends State<CatItem> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: ColorsApp.primary,
              ),
              child: Image.network(widget.cat.image?.url ?? '', fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleSmall(text: widget.cat.name, color: ColorsApp.primary,),
              TextApp(text: 'Origin: ${widget.cat.origin}', color: ColorsApp.textColor.withOpacity(0.5),),
              TextApp(text: 'intelligence: ${widget.cat.intelligence}', color: ColorsApp.textColor,),
            ],
          )),
          SizedBox(
            width: 62,
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>CatDetailScreen(cat: widget.cat)));
              },
              style: TextButton.styleFrom(padding: PaddingApp.zero, ),
              child: TextApp(text: "See more", color: ColorsApp.primary.withOpacity(0.7),),
            ),
          )
        ],
      ),
    );
  }
}
