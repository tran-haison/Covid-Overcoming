/// Database exception
class DatabaseException implements Exception {
  const DatabaseException({String? message}) : super();
}

/// Server exception
class ServerException implements Exception {
  const ServerException({String? message}) : super();
}
