import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(String email, String password);

  Future<Either> signUp(String email, String password, String name);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return const Right('Signed in successfully');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid email or password.';
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> signUp(String email, String password, String name) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(name);
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': userCredential.user?.email,
      });
      return const Right('Signed up successfully');
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      return Left(errorMessage);
    }
  }
}
