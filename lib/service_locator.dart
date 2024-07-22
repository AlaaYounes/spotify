import 'package:get_it/get_it.dart';
import 'package:spotify/features/authentication/data/data_sources/firebase_service.dart';
import 'package:spotify/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:spotify/features/authentication/domain/repositories/auth_repository.dart';
import 'package:spotify/features/authentication/domain/use_cases/auth_useCase.dart';
import 'package:spotify/features/layout/data/data_sources/firebase_service.dart';
import 'package:spotify/features/layout/data/repositories/song_repository_impl.dart';
import 'package:spotify/features/layout/domain/repositories/song_repo.dart';
import 'package:spotify/features/layout/domain/use_cases/song_useCase.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  //! Features - Authentication
  sl.registerLazySingleton<AuthFirebaseService>(
      () => AuthFirebaseServiceImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton(() => AuthUseCase());

  //! Features - Layout
  sl.registerLazySingleton<SongFirebaseService>(
      () => SongFirebaseServiceImpl());
  sl.registerLazySingleton<SongRepository>(() => SongRepositoryImpl());
  sl.registerLazySingleton(() => SongUseCases());
}
