// import 'package:course_app/core/errors/failure.dart';
// import 'package:course_app/core/utils/typedef.dart';
// import 'package:course_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
// import 'package:course_app/src/authentication/domain/entities/user.dart';
// import 'package:course_app/src/authentication/domain/repositories/authentication_repository.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../../../core/errors/exceptions.dart';
//
// class AuthenticationRepositoryImplementation implements AuthenticationRepository {
//
//   const AuthenticationRepositoryImplementation(this._remoteDataSource);
//   final AuthenticationRemoteDataSource _remoteDataSource;
//   @override
//   ResultVoid createUser({
//     required String createdAt,
//     required String name,
//     required String avatar}) async {
//     // final datasource = AuthenticationRemoteDataSource();
//     // datasource.createUser(createdAt: createdAt, name: name, avatar: avatar)
//     try {
//       await _remoteDataSource.createUser(
//           createdAt: createdAt, name: name, avatar: avatar);
//       return const Right(null);
//     } on APIException catch (e) {
//       return Left(APIFailure.fromException(e));
//     }
//   }
//
//   @override
//   ResultFuture<List<User>> getUsers() async {
//     try {
//       final result = await _remoteDataSource.getUsers();
//       return Right(result);
//     } on APIException catch(e) {
//       return Left(APIFailure.fromException(e));
//     }
//   }
//
// }