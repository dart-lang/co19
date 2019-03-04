/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 * . . .
 * If this stream contains an error, or if the call to test throws, the returned
 * future is completed with that error, and processing stops.
 *
 * @description Checks that if [test] throws, the future is completed with that
 * error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<dynamic> checkEvery(test) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];
  Completer<dynamic> completer = new Completer<dynamic>();
  Future<dynamic> f = completer.future;

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");
  receiver.close();

  Future<dynamic> fValue = receiver.every(test);
  fValue.then((value) {
    if (!completer.isCompleted) {
      completer.complete(value);
    }
    return f;
  }).catchError((e) {
    if (!completer.isCompleted) {
      completer.complete(e);
    }
  });

  return f;
}

main() async {
  int attempts = 5;

  for (int i = 0; i < attempts; i++) {
    dynamic value = await checkEvery((e) => throw 1);
    if (value == 1) {
      break;
    }
    if (i == attempts - 1) {
      print('$value element not found. Look like test failed.');
    }
  }
}
