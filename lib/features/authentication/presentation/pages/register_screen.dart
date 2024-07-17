import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/features/authentication/presentation/pages/signin_screen.dart';
import 'package:spotify/features/layout/presentation/pages/home_screen.dart';
import 'package:spotify/utils/widgets/basicAppButton.dart';
import 'package:spotify/utils/widgets/custom_form_field.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthStates>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: cubit.signUpFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: const AppHeader(),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      "Register",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          CustomFormField(
                            controller: cubit.nameController,
                            hintText: "Full Name",
                            borderRadius: 30.r,
                            backgroundColor: Colors.transparent,
                            onTapOutside: (p0) =>
                                FocusScope.of(context).unfocus(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormField(
                            controller: cubit.signUpEmailController,
                            hintText: "Enter username or email.",
                            borderRadius: 30.r,
                            backgroundColor: Colors.transparent,
                            onTapOutside: (p0) =>
                                FocusScope.of(context).unfocus(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email address.';
                              } else if (cubit.isValidEmail(value)) {
                                return null;
                              }
                              return 'Please enter a valid email\n ex: z5YnY@example.com';
                              ;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormField(
                            controller: cubit.signUpPasswordController,
                            hintText: "Password",
                            borderRadius: 30.r,
                            backgroundColor: Colors.transparent,
                            onTapOutside: (p0) =>
                                FocusScope.of(context).unfocus(),
                            isPassword: cubit.signUpIsVisible,
                            suffix: GestureDetector(
                                onTap: cubit.showPasswordSignUp,
                                child: cubit.signUpIsVisible
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(
                                        Icons.visibility_off_outlined)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              } else if (cubit.isValidPassword(value!)) {
                                return null;
                              } else {
                                return 'Password must be at least 8 characters\n like numbers and letters.';
                              }
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          BasicAppButton(
                            onPressed: () async {
                              if (cubit.signUpFormKey.currentState!
                                  .validate()) {
                                cubit.signUp();
                              }
                            },
                            title: 'Create Account',
                            width: double.infinity,
                            height: 80.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1.h,
                            width: double.infinity,
                            color: AppColors.grey.withOpacity(.5),
                          ),
                        ),
                        Text(
                          '  Or  ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 12.sp, color: AppColors.grey),
                        ),
                        Expanded(
                          child: Container(
                            height: 1.h,
                            width: double.infinity,
                            color: AppColors.grey.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SvgPicture.asset(AppVectors.google),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do you have an account?",
                            style: Theme.of(context).textTheme.labelSmall),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign  In",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, AuthStates state) {
          if (state is SignUpSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(email: ''),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SignUpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
      ),
    );
  }
}
