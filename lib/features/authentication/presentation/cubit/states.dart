import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {
  final String message;
  final User user;

  SignUpSuccessState({required this.message, required this.user});
}

class SignInSuccessState extends AuthStates {
  final String message;
  final User user;

  SignInSuccessState({required this.message, required this.user});
}

class ShowPasswordState extends AuthStates {}

class HidePasswordState extends AuthStates {}

class SignInErrorState extends AuthStates {
  final String errorMessage;

  SignInErrorState({required this.errorMessage});
}

class SignUpErrorState extends AuthStates {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}
