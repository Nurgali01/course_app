// import 'dart:convert';
// import 'package:course_app/core/errors/exceptions.dart';
// import 'package:course_app/src/authentication/data/models/user_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import '../../../../core/utils/constants.dart';
// import '../../../../core/utils/typedef.dart';
//
// abstract class AuthenticationRemoteDataSource {
//   Future<void> createUser({
//     required String createdAt,
//     required String name,
//     required String avatar,
//   });
//
//   Future<List<UserModel>> getUsers();
// }
//
// const kCreateUserEndpoint = '/test-api/users';
// const kGetUsersEndpoint = 'test-api/users';
//
// class AuthRemoteDataSrcImpl implements AuthenticationRemoteDataSource {
//   const AuthRemoteDataSrcImpl(this._client);
//   final http.Client _client;
//
//   @override
//   Future<void> createUser({required String createdAt, required String name, required String avatar}) async {
//     try {
//       final response = await _client.post(
//         Uri.https(kBaseUrl, kGetUsersEndpoint),
//         body: jsonEncode({
//           'createdAt': createdAt,
//           'name': name,
//           'avatar': avatar
//         }),
//         headers: {
//           'Content-Type': 'application/json'
//         }
//       );
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         throw APIException(
//           message: response.body,
//           statusCode: response.statusCode,
//         );
//       }
//     } on APIException {
//       rethrow;
//     } catch (e) {
//       throw APIException(
//         message: e.toString(),
//         statusCode: 505,
//       );
//     }
//   }
//
//   @override
//   Future<List<UserModel>> getUsers() async {
//     try {
//       final response = await _client.get(
//         Uri.https(kBaseUrl, kGetUsersEndpoint),
//       );
//       debugPrint(Uri.https(kBaseUrl, kGetUsersEndpoint).toString());
//       if (response.statusCode != 200) {
//         throw APIException(
//             message: response.body, statusCode: response.statusCode);
//       }
//       return List<DataMap>.from(jsonDecode(response.body) as List)
//           .map((userData) => UserModel.fromMap(userData)).toList();
//     }on APIException {
//       rethrow;
//     } catch (e) {
//       throw APIException(
//         message: e.toString(),
//         statusCode: 505,
//       );
//     }
//   }
// }
