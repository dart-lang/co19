/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 *
 * Calls test on each element of the stream. If the call returns false, the
 * returned future is completed with false and processing stops.
 *
 * If the stream ends without finding an element that test rejects, the returned
 * future is completed with true.
 *
 * @description Checks that [test] accepts the elements provided by this
 * RawDatagramSocket, and if the call returns false, the returned future is
 * completed with false and processing stops, if the stream ends without finding
 * an element that test rejects, the returned future is completed with true.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<bool> checkEvery(int nCall) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  List<RawSocketEvent> received = [];
  Completer<bool> completer = new Completer<bool>();
  Future<bool> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  int nTestCall = 0;

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  bool test(e) {
    nTestCall++;
    if (nTestCall < nCall) {
      return true;
    } else {
      return false;
    }
  }

  Stream bcs = receiver.asBroadcastStream();
  Future eValue = bcs.every(test);

  eValue.then((value) {
    if (!completer.isCompleted) {
      completer.complete(value);
      receiver.close();
    }
    return f;
  });

  bcs.listen((event) {
    received.add(event);
    receiver.receive();
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
    }
  });

  return f;
}

main() async {
  int attempts = 5;

  check(int nCall) async {
    for (int i = 0; i < attempts; i++) {
      bool value = await checkEvery(nCall);
      Expect.isTrue(value is bool);
      if (value == true && nCall == 5) {
        break;
      }
      if (value is bool) {
        break;
      }
      if (i == attempts - 1) {
        print('$value element not found. Look like test failed.');
      }
    }
  }

  for (int i = 1; i <= 5; i++) {
    await check(i);
  }
}
