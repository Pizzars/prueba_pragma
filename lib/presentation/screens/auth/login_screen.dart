import 'package:flutter/material.dart';
import 'package:prueba_pragma/config/helpers/responsive.dart';
import 'package:prueba_pragma/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_pragma/presentation/screens/widgets/input_container.dart';
import 'package:prueba_pragma/presentation/screens/widgets/space_app.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/title_app.dart';
import '../../../config/helpers/hero_tags.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:prueba_pragma/presentation/blocs/blocs.dart';
// import 'package:prueba_pragma/presentation/screens/widgets/buttons/button_app.dart';
// import 'package:prueba_pragma/presentation/screens/widgets/buttons/button_outline_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LoginScreenView(),
    );
  }
}

class _LoginScreenView extends StatelessWidget {
  const _LoginScreenView();

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive(context);
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
              const TitleApp(text: "Iniciar Sesión"),
              const SpaceApp(space: 3,),
              InputContainer(label: "Usuario", hintText: "Ingresa tu usuario", controller: user,),
              const SpaceApp(),
              InputContainer(label: "Contraseña", hintText: "Ingresa tu contraseña", showHidePassword: true, obscureText: true, controller: password,),
              // BlocBuilder<LoginCubit, LoginState>(
              //   builder: (context, state){
              //     return Column(
              //       children: [
              //         if(state.error != null)
              //           const SpaceApp(),
              //         if(state.error != null)
              //           Text(state.error!, style: const TextStyle(color: Colors.red),),
              //         const SpaceApp(space: 2,),
              //         if(state.load)
              //           const CircularProgressIndicator(),
              //         if(!state.load)
              //           ButtonApp(text: "Iniciar Sesión", onPressed: (){
              //             if(user.text.isEmpty || password.text.isEmpty){
              //               context.read<LoginCubit>().setError("Debe completar todos los campos");
              //               return;
              //             }
              //             context.read<LoginCubit>().login(user: user.text, password: password.text);
              //           }),
              //         if(!state.load)
              //           const SpaceApp(),
              //         if(!state.load)
              //           ButtonOutlineApp(text: "Registrarse", onPressed: () => context.push(Routes.signup)),
              //       ],
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}