import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/features/authentication/presentation/pages/auth_changes.dart';
import 'package:spotify/utils/widgets/basicAppButton.dart';

class HomeScreen extends StatelessWidget {
  User user;

  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(user.displayName ?? "No Name"),
            SizedBox(
              height: 10.h,
            ),
            const Text("Welcome To My App"),
            BasicAppButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthChanges()));
                  });
                },
                title: "Sign Out"),
          ],
        ),
      ),
    );
  }
}
