part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initOnBoardingInit();
  await _initAuth();
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(
        () => AuthBloc(
            signIn: sl(), signUp: sl(), forgotPassword: sl(), updateUser: sl()),
    )
      ..registerLazySingleton(() => SignIn(sl()))
      ..registerLazySingleton(() => SignUp(sl()))
      ..registerLazySingleton(() => ForgotPassword(sl()))
      ..registerLazySingleton(() => UpdateUser(sl()))
      ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
      ..registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(
              authClient: sl(),
              cloudStoreClient: sl(),
              dbClient: sl(),
          ),
      )..registerLazySingleton(() => FirebaseAuth.instance)
      ..registerLazySingleton(() => FirebaseFirestore.instance)
      ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initOnBoardingInit() async{
  final prefs = await SharedPreferences.getInstance();

  sl..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
  );
  sl.registerLazySingleton(() => CacheFirstTimer(sl()));
  sl.registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()));
  sl.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()));
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
          () => OnBoardingLocalDataSrcImpl(sl()));
  sl.registerLazySingleton(() => prefs);
}























// import 'package:course_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
// import 'package:course_app/src/authentication/data/repositories/authentication_repository_implementation.dart';
// import 'package:course_app/src/authentication/domain/repositories/authentication_repository.dart';
// import 'package:course_app/src/authentication/domain/usecases/create_user.dart';
// import 'package:course_app/src/authentication/domain/usecases/get_users.dart';
// import 'package:course_app/src/authentication/presentation/cubit/authentication_cubit.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
//
// final sl = GetIt.instance;
//
// Future<void> init() async {
//   sl
//     ..registerFactory(() => AuthenticationCubit(createUser: sl(), getUsers: sl()))
//     ..registerLazySingleton(() => CreateUser(sl()))
//     ..registerLazySingleton(() => GetUsers(sl()))
//     ..registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImplementation(sl()))
//     ..registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthRemoteDataSrcImpl(sl()))
//     ..registerLazySingleton(() => http.Client());
// }
