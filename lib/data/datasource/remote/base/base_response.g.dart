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
      responseType: $enumDecode(_$ResponseTypeEnumMap, json['response']),
      message: json['message'] as String,
      code: json['code'] as int,
      results: BaseConverter<T?>().fromJson(json['results']),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'response': _$ResponseTypeEnumMap[instance.responseType],
      'message': instance.message,
      'code': instance.code,
      'results': BaseConverter<T?>().toJson(instance.results),
    };

const _$ResponseTypeEnumMap = {
  ResponseType.success: 'success',
  ResponseType.error: 'error',
};
