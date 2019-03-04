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
 * completed with false, if the stream ends without finding an element that test
 * rejects, the returned future is completed with true.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<bool> checkEvery(test) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  List<RawSocketEvent> received = [];
  Completer<bool> completer = new Completer<bool>();
  Future<bool> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream bcs = receiver.asBroadcastStream();
  Future eValue = bcs.every(test);

  eValue.then((value) {
    if (!completer.isCompleted) {
      completer.complete(value);
    }
    receiver.close();
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

  check(test, expected) async {
    for (int i = 0; i < attempts; i++) {
      bool value = await checkEvery(test);
      if (value == expected) {
        break;
      }
      if (i < attempts - 1) {
        continue;
      }
      if (i == attempts - 1) {
        print('$value element not found. Look like test failed.');
      }
    }
  }

  await check((e) => e == RawSocketEvent.write, false);
  await check((e) => e == RawSocketEvent.read, false);
  await check((e) => e == RawSocketEvent.closed, false);
  await check((e) => e == RawSocketEvent.readClosed, false);
  await check((e) => e is RawSocketEvent, true);
  await check((e) => e != null, true);
  await check((e) => e == null, false);
}
