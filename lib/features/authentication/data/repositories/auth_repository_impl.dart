import 'package:dartz/dartz.dart';
import 'package:spotify/features/authentication/data/data_sources/firebase_service.dart';

import '../../../../service_locator.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final authFirebaseService = sl.get<AuthFirebaseService>();

  @override
  Future<Either> signIn(String email, String password) async {
    return await authFirebaseService.signIn(email, password);
  }

  @override
  Future<Either> signUp(String email, String password, String name) async {
    return await authFirebaseService.signUp(email, password, name);
  }
}
