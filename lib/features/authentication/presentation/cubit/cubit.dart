import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/authentication/presentation/cubit/states.dart';

import '../../../../service_locator.dart';
import '../../domain/use_cases/auth_useCase.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  var authUseCase = sl.get<AuthUseCase>();

  static AuthCubit get(context) => BlocProvider.of(context);
  bool signInIsVisible = true;
  bool signUpIsVisible = true;
  var signUpEmailController = TextEditingController();
  var signInEmailController = TextEditingController();
  var nameController = TextEditingController();
  var signUpPasswordController = TextEditingController();
  var signInPasswordController = TextEditingController();
  var signInFormKey = GlobalKey<FormState>();
  var signUpFormKey = GlobalKey<FormState>();

  showPasswordSignIn() {
    if (signInIsVisible) {
      signInIsVisible = false;
      emit(HidePasswordState());
    } else {
      signInIsVisible = true;
      emit(ShowPasswordState());
    }
  }

  showPasswordSignUp() {
    if (signUpIsVisible) {
      signUpIsVisible = false;
      emit(HidePasswordState());
    } else {
      signUpIsVisible = true;
      emit(ShowPasswordState());
    }
  }

  signUp() async {
    emit(AuthLoadingState());
    var response = await authUseCase.signUp(
      signUpEmailController.text,
      signUpPasswordController.text,
      nameController.text,
    );
    response.fold(
      (l) => emit(SignUpErrorState(errorMessage: l)),
      (r) {
        User? user = FirebaseAuth.instance.currentUser;
        emit(SignUpSuccessState(message: r, user: user!));
      },
    );
  }

  signIn() async {
    emit(AuthLoadingState());
    var response = await authUseCase.signIn(
        signInEmailController.text, signInPasswordController.text);
    response.fold(
      (l) => emit(SignInErrorState(errorMessage: l)),
      (r) {
        User? user = FirebaseAuth.instance.currentUser;
        emit(SignInSuccessState(message: r, user: user!));
      },
    );
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
