import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/remote/base/base_converter.dart';
import 'package:either_dart/either.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

enum ResponseType { success, error }

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse({
    required this.responseType,
    required this.message,
    required this.code,
    this.results,
  });

  @JsonKey(name: 'response')
  final ResponseType responseType;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'code')
  final int code;

  @JsonKey(name: 'results')
  @BaseConverter()
  final T? results;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$ApiResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return _$ApiResponseToJson(this, toJsonT);
  }
}

extension ApiResponseExtension<T> on ApiResponse<T> {
  Either<Error, T> get response {
    if (responseType == ResponseType.success && results != null) {
      return Right(results!);
    }
    return Left(ServerError(message, code));
  }

  Either<Error, T?> get responseNullable {
    if (responseType == ResponseType.success) {
      return Right(results);
    }
    return Left(ServerError(message, code));
  }

  Either<Error, bool> get responseTrue {
    if (responseType == ResponseType.success) {
      return const Right(true);
    }
    return Left(ServerError(message, code));
  }
}
