import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final String statusCode; // Changed to String

  @override
  List<Object?> get props => [message, statusCode]; // Changed from List<dynamic> to List<Object?>
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message, this.statusCode = 500});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode]; // Changed from List<dynamic> to List<Object?>
}
