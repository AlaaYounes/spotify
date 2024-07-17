import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/features/authentication/presentation/pages/signin_screen.dart';
import 'package:spotify/utils/widgets/basicAppButton.dart';
import 'package:spotify/utils/widgets/custom_form_field.dart';

import '../widgets/header.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      controller: nameController,
                      hintText: "Full Name",
                      borderRadius: 30.r,
                      backgroundColor: Colors.transparent,
                      onTapOutside: (p0) => FocusScope.of(context).unfocus(),
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomFormField(
                      controller: emailController,
                      hintText: "Enter username or email",
                      borderRadius: 30.r,
                      backgroundColor: Colors.transparent,
                      onTapOutside: (p0) => FocusScope.of(context).unfocus(),
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomFormField(
                      controller: passwordController,
                      hintText: "Password",
                      borderRadius: 30.r,
                      backgroundColor: Colors.transparent,
                      onTapOutside: (p0) => FocusScope.of(context).unfocus(),
                      isPassword: true,
                      suffix: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.visibility_outlined)),
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    BasicAppButton(
                      onPressed: () {},
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
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign  In",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
  }
}
