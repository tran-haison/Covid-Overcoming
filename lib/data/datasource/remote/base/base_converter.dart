import 'package:covid_overcoming/config/logger/logger.dart';
import 'package:json_annotation/json_annotation.dart';

class BaseConverter<T> implements JsonConverter<T, dynamic> {
  const BaseConverter();

  @override
  T fromJson(dynamic json) {
    try {
      return _fromJsonAsT(json);
    } catch (e) {
      logger.e('Unable to parse $json to ${T.runtimeType}\nMessage: $e');
    }
    return json as T;
  }

  @override
  dynamic toJson(T object) {
    try {
      return _getToJson(runtimeType, this);
    } catch (e) {
      logger.e('Unable to parse $object to ${T.runtimeType}\nMessage: $e');
    }
    return object;
  }

  T _getToJson(Type type, dynamic data) {
    switch (type) {
      // TODO(son): Implement cases
    }
    return data as T;
  }

  T _fromJsonAsT (dynamic json) {
    final type = T.toString();
    if (json is List && type.contains('List<')) {
      // Get single object type as string
      // List<User> -> substring of type is "User"
      final String itemType = type.substring(5, type.length - 1);
      final List? tempList = _getListFromType(itemType);
      for (var itemJson in json) {
        tempList?.add(_fromJsonSingle(itemType, itemJson));
      }
      return tempList as T;
    }
    return _fromJsonSingle(T.toString(), json) as T;
  }

  /// Convert json to model based on type
  dynamic _fromJsonSingle(String type, dynamic json) {
    final jsonMap = json as Map<String, dynamic>;
    switch (type) {
      // TODO(son): implement response model from json
      // case 'User':
      // case 'User?':
      //    return User.fromJson(json)
    }
    logger.e('Parse error - Type:$type');
    return null;
  }

  /// Empty list is returned by type
  List? _getListFromType(String type) {
    switch (type) {
      // TODO(son): return list of type
      // case 'User':
      //   return <User>[];
    }
    return null;
  }
}