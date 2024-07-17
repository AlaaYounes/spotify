import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify/features/authentication/presentation/pages/auth_home.dart';
import 'package:spotify/features/layout/presentation/pages/home_screen.dart';

class AuthChanges extends StatelessWidget {
  const AuthChanges({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen(email: snapshot.data!.email!);
        } else {
          return const AuthHome();
        }
      },
    );
  }
}
