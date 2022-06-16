// // https://medium.com/dreamwod-tech/flutter-dio-framework-best-practices-668985fc75b7
// // https://github.com/VB10/shoppii/tree/master/shoppingapp/lib/core

/// This service will change later
class ServerException implements Exception {
  int statusCode;

  ServerException(this.statusCode);

  @override
  String toString() {
    switch (statusCode) {
      case 400:
        return "The request was unacceptable, often due to missing a required parameter";
      case 401:
        return "Invalid Access Token";
      case 403:
        return "Missing permissions to perform request";
      case 404:
        return "The requested resource doesn’t exist";
      case 500:
      case 503:
        return "Something went wrong on our end";
      default:
        return "Other server error";
    }
  }
}

