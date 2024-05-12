//
// import 'package:course_app/core/usecase/usecase.dart';
// import 'package:course_app/core/utils/typedef.dart';
// import 'package:course_app/src/authentication/domain/repositories/authentication_repository.dart';
// import 'package:equatable/equatable.dart';
//
// class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
//   const CreateUser(this._repository);
//
//   final AuthenticationRepository _repository;
//
//   @override
//   ResultFuture call(CreateUserParams params) async => _repository.createUser(
//       createdAt: params.createdAt,
//       name: params.name,
//       avatar: params.avatar,);
// }
// class CreateUserParams extends Equatable {
//
//   const CreateUserParams({
//     required this.createdAt,
//     required this.name,
//     required this.avatar,
//   });
//
//   const CreateUserParams.empty():
//       this(
//           createdAt: '_empty.createdAt',
//           name: '_empty.name',
//           avatar: '_empty.avatar');
//
//   final String createdAt;
//   final String name;
//   final String avatar;
//
//   @override
//   List<Object?> get props => [createdAt, name, avatar];
//
// }
