import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';
import 'package:prueba_pragma/presentation/screens/home/widgets/cat_item.dart';
import 'package:prueba_pragma/presentation/screens/widgets/input_container.dart';

import '../../../blocs/cats/cats_cubit.dart';

class CatsView extends StatefulWidget {
  const CatsView({Key? key}) : super(key: key);

  @override
  State<CatsView> createState() => _CatsViewState();
}

class _CatsViewState extends State<CatsView> {

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatsCubit, CatsState>(
        builder: (context, state) {
          final cats = state.cats ?? [];
          final List<CatModel> newList = controller.text.length < 2 ? cats : cats.where((cat) => cat.name.toLowerCase().contains(controller.text.toLowerCase())).toList();
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                InputContainer(label: "Search", hintText: "Search", search: true, controller: controller, onChanged: (v){
                  setState(() {});
                },),
                const SizedBox(height: 16,),
                Expanded(
                  child: ListView.builder(
                    itemCount: newList.length,
                    itemBuilder: (_, index) {
                      final cat = newList[index];
                      return CatItem(cat: cat);
                    },
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

}