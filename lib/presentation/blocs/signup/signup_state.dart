part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final bool load;
  final String? error;
  final UserModel? user;

  const SignupState({this.load = false, this.error, this.user});

  @override
  List<Object?> get props => [ load, error, user ];

}