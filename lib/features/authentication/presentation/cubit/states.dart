abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {
  final String message;

  SignUpSuccessState({required this.message});
}

class SignInSuccessState extends AuthStates {
  final String message;

  SignInSuccessState({required this.message});
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
