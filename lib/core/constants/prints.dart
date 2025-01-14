import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'bloc_observer.dart';

///* Print shortcuts `print()`
void printMe(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
} 

///* Print in log shortcuts `log()`
void printWarning(dynamic data) {
  if (kDebugMode) {
    logger.i(data);
  }
}

void printMeLog(dynamic data) {
  if (kDebugMode) {
    log(data, time: DateTime.now(), name: 'LOG =>> ');
  }
}
