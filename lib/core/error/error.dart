import 'package:equatable/equatable.dart';

abstract class Error extends Equatable {
  const Error(this.message, [this.code]);

  final String message;
  final int? code;

  @override
  List<Object?> get props => [message, code];
}

/// Database error
class DatabaseError extends Error {
  const DatabaseError(String message, [int? code]) : super(message, code);
}

/// Server error
class ServerError extends Error {
  const ServerError(String message, [int? code]) : super(message, code);
}

/// Auth error
class AuthError extends Error {
  const AuthError(String message, [int? code]) : super(message, code);
}

/// Network error
class NetworkError extends Error {
  const NetworkError(String message, [int? code]) : super(message, code);
}

/// Other error
class OtherError extends Error {
  const OtherError(String message, [int? code]) : super(message, code);
}
