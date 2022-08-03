// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      status: $enumDecode(_$StatusEnumMap, json['status']),
      message: json['message'] as String,
      code: json['code'] as int,
      results: BaseConverter<T?>().fromJson(json['results']),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status],
      'message': instance.message,
      'code': instance.code,
      'results': BaseConverter<T?>().toJson(instance.results),
    };

const _$StatusEnumMap = {
  Status.success: 'success',
  Status.error: 'error',
};
