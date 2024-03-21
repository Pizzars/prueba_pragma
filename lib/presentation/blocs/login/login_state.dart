part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool load;
  final String? error;
  final UserModel? user;

  const LoginState({this.load = false, this.error, this.user});

  @override
  List<Object?> get props => [ load, error, user ];

}