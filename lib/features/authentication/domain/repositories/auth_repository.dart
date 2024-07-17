import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signIn(String email, String password);

  Future<Either> signUp(String email, String password, String name);
}
