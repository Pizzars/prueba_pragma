import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_inlaze/config/config.dart';
import 'package:prueba_inlaze/presentation/blocs/blocs.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/buttons/button_app.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/buttons/button_outline_app.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/input_container.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/space_app.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/texts/title_app.dart';

import '../../../config/helpers/hero_tags.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SignUpScreenView(),
    );
  }
}

class _SignUpScreenView extends StatelessWidget {
  const _SignUpScreenView();

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);
    // final signupCubit = context.watch<SignupCubit>();
    final name = TextEditingController();
    final user = TextEditingController();
    final password = TextEditingController();

    return BaseScreen(
      gradient: false,
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: HeroTags.logo,
                child: SizedBox(
                  width: responsive.width(50),
                  child: Image.asset('assets/images/general/logo.png', fit: BoxFit.contain,),
                ),
              ),
              const SpaceApp(space: 4,),
              const TitleApp(text: "Registro"),
              const SpaceApp(space: 3,),
              InputContainer(label: "Nombre", hintText: "Ingresa tu nombre", controller: name,),
              const SpaceApp(),
              InputContainer(label: "Usuario", hintText: "Ingresa tu usuario", controller: user,),
              const SpaceApp(),
              InputContainer(
                label: "Contraseña",
                hintText: "Ingresa tu contrasela",
                showHidePassword: true,
                obscureText: true,
                controller: password,
              ),
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state){
                  return Column(
                    children: [
                      if(state.error != null)
                        const SpaceApp(),
                      if(state.error != null)
                        Text(state.error!, style: const TextStyle(color: Colors.red),),
                      const SpaceApp(space: 2,),
                      if(state.load)
                        const CircularProgressIndicator(),
                      if(!state.load)
                        ButtonApp(text: "Crear Cuenta", onPressed: (){
                          if(name.text.isEmpty || user.text.isEmpty || password.text.isEmpty){
                            context.read<SignupCubit>().setError("Debe completar todos los campos");
                            return;
                          }
                          context.read<SignupCubit>().createUser(name: name.text, user: user.text, password: password.text);
                        }),
                      if(!state.load)
                        const SpaceApp(),
                      if(!state.load)
                        ButtonOutlineApp(text: "Ya tengo cuenta", onPressed: () => context.pop()),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}