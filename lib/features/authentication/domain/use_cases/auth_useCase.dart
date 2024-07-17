import 'package:dartz/dartz.dart';
import 'package:spotify/features/authentication/domain/repositories/auth_repository.dart';

import '../../../../service_locator.dart';

class AuthUseCase {
  final authRepo = sl.get<AuthRepository>();

  Future<Either> signIn(String email, String password) async {
    return await authRepo.signIn(email, password);
  }

  Future<Either> signUp(String email, String password, String name) async {
    return await authRepo.signUp(email, password, name);
  }
}
