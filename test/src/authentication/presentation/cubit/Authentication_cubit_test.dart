// import 'package:bloc_test/bloc_test.dart';
// import 'package:course_app/core/errors/failure.dart';
// import 'package:course_app/src/authentication/domain/usecases/create_user.dart';
// import 'package:course_app/src/authentication/domain/usecases/get_users.dart';
// import 'package:course_app/src/authentication/presentation/cubit/authentication_cubit.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
//
// class MockGetUsers extends Mock implements GetUsers {}
// class MockCreateUser extends Mock implements CreateUser {}
//
// void main() {
//   late GetUsers getUsers;
//   late CreateUser createUser;
//   late AuthenticationCubit cubit;
//
//   const tCreateUserParams = CreateUserParams.empty();
//   const tAPIFailure = APIFailure(message: 'message', statusCode: 400);
//
//   setUp(() {
//     getUsers = MockGetUsers();
//     createUser = MockCreateUser();
//     cubit = AuthenticationCubit(createUser: createUser, getUsers: getUsers);
//     registerFallbackValue(tCreateUserParams);
//   });
//
//   tearDown(() => cubit.close());
//
//   test('initial state should be [AuthenticationInitial]', () async {
//     expect(cubit.state, const AuthenticationInitial());
//   });
//
//   group('createUser', () {
//     blocTest<AuthenticationCubit, AuthenticationState>(
//         'should emit [CreatingUser, UserCreated] when successful',
//         build: () {
//           when(() => createUser(any())).thenAnswer(
//                 (_) async => const Right(null),
//           );
//           return cubit;
//         },
//         act: (cubit) =>
//             cubit.createUser(
//                 createdAt: tCreateUserParams.createdAt,
//                 name: tCreateUserParams.name,
//                 avatar: tCreateUserParams.avatar)
//     );
//     expect:
//         () =>
//     const [
//       CreatingUser(),
//       UserCreated(),
//     ];
//     verify:
//         () {
//       verify(() => createUser(tCreateUserParams)).called(1);
//       verifyNoMoreInteractions(createUser);
//     };
//     blocTest<AuthenticationCubit, AuthenticationState>(
//       'should emit [CreatingUser, AuthenticationError] when unsuccessful',
//       build: () {
//         when(() => createUser(any())).thenAnswer(
//                 (_) async => const Left(tAPIFailure));
//         return cubit;
//       },
//       act: (cubit) =>
//           cubit.createUser(
//               createdAt: tCreateUserParams.createdAt,
//               name: tCreateUserParams.name,
//               avatar: tCreateUserParams.avatar),
//       expect: () =>
//       [
//         const CreatingUser(),
//         AuthenticationError(tAPIFailure.errorMessage),
//       ],
//
//     );
//     verify:
//         () {
//       verify(() => createUser(tCreateUserParams)).called(1);
//       verifyNoMoreInteractions(createUser);
//     };
//   });
//
//   group('getUsers', () {
//     blocTest<AuthenticationCubit, AuthenticationState>(
//       'should emit [GettingUsers, UserLoaded] when successful',
//       build: () {
//         when(() => getUsers()).thenAnswer((_) async => const Right([]));
//         return cubit;
//       },
//       act: (cubit) => cubit.getUsers(),
//       expect: () => const [
//         GettingUser(),
//         UsersLoaded([]),
//       ],
//     verify: (_) {
//         verify(() => getUsers()).called(1);
//         verifyNoMoreInteractions(getUsers);
//     }
//     );
//
//     blocTest<AuthenticationCubit, AuthenticationState>(
//         'should emit [GettingUsers, AuthenticationError] when unsuccessfully',
//         build: () {
//           when(() => getUsers()).thenAnswer((_) async => const Left(tAPIFailure));
//           return cubit;
//     },
//     act: (cubit) => cubit.getUsers(),
//     expect: () => [
//       const GettingUser(),
//       AuthenticationError(tAPIFailure.errorMessage),
//     ],
//     verify: (_) {
//     verify(() => getUsers()).called(1);
//     verifyNoMoreInteractions(getUsers);
//     }
//     );
//   });
// }