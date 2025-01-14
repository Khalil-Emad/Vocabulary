import 'package:flutter/material.dart';
import 'package:vocabulary/main.dart';

class ServerException implements Exception {
  final int code;
  final String message;
  // final int success;

  ServerException({
    // required this.success,
    required this.code,
    required this.message,
  });
}

class CacheException implements Exception {
  final dynamic error;

  CacheException(this.error);
}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
