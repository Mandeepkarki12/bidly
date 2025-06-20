class ServerException implements Exception {
  final String message;

  const ServerException(this.message);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}

class DataParsingException implements Exception {
  final String message;
  const DataParsingException(this.message);
}

class ClientException implements Exception {
  final String message;
  const ClientException(this.message);
}
