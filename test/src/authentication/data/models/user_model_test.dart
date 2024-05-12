// import 'dart:convert';
//
// import 'package:course_app/core/utils/typedef.dart';
// import 'package:course_app/src/authentication/data/models/user_model.dart';
// import 'package:course_app/src/authentication/domain/entities/user.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import '../../../../fixtures/fixture_reader.dart';
//
// const tModel = UserModel.empty();
//
// void main() {
//   test('should be a subclass of [User] entity', () {
//
//     expect(tModel, isA<User>());
//   });
//
//   final tJson = fixture('user.json');
//   final tMap = jsonDecode(tJson) as DataMap;
//
//   group('fromMap', () {
//     test('should return a [UserModel] with the right data', () {
//         final result = UserModel.fromMap(tMap);
//         expect(result, equals(tModel));
//     });
//   });
//
//   group('fromJson', () {
//     test('should return a [UserModel] with the right data', () {
//       final result = UserModel.fromJson(tJson);
//       expect(result, equals(tModel));
//     });
//   });
//
//   group('toMap', () {
//     test('should return a [Map] with the right data', ()
//     {
//       final result = tModel.toMap();
//       expect(result, equals(tMap));
//     });
//   });
//
//   group('toJson', () {
//     test('should return a [JSON] string with the right data', ()
//     {
//       final result = tModel.toJson();
//       final tJson = jsonEncode({
//         "id": "1",
//         "avatar": "_empty.avatar",
//         "createdAt": "_empty.createdAt",
//         "name": "_empty.name"
//       });
//       expect(result, equals(tJson));
//     });
//   });
//
//   group('copyWith', () {
//     test('should return a [UserModel] with the right data', ()
//     {
//       final result = tModel.copyWith(name: 'Damir');
//       expect(result.name, equals('Damir'));
//     });
//   });
// }