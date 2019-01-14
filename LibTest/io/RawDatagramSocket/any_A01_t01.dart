/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 *
 * Calls test on each element of the stream. If the call returns true, the
 * returned future is completed with true and processing stops.
 *
 * @description Checks whether test accepts any element provided by this stream
 * and stops listening to the stream after the first matching element has been
 * found.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<int>> anyElement(RawDatagramSocket receiver, int expectedValue,
    bool shouldFind, {Duration delay = const Duration(seconds: 2)}) {
  List<int> tested = [];
  Completer<List<int>> completer = new Completer<List<int>>();
  Future<List<int>> f = completer.future;

  bool test(RawSocketEvent x) {
    var d = receiver?.receive();
    if (d != null) {
      tested.add(d.data[0]);
      return d.data[0] == expectedValue;
    } else {
      return false;
    }
  }

  receiver.any((event) => test(event)).then((value) {
    Expect.equals(true, value);
    if (!completer.isCompleted) {
      receiver.close();
      completer.complete(tested);
    }
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
      completer.complete(tested);
    }
  });
  return f;
}

check(int expectedValue, {int attempts = 5}) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0], [1], [2], [3]];
  List<int> tested = [];
  if (expectedValue >= toSend.length) {
    return;
  }

  List<int> bytesSent;
  for (int i = 0; i < attempts; i++) {
    bytesSent =
        await sendDatagramOnce(producer, toSend, localhost, receiver.port);
    if (bytesSent[expectedValue] == 1) {
      producer.close();
      break;
    }
  }
  Expect.isTrue(bytesSent[expectedValue] == 1, "Required datagram wasn't sent");

  tested = await anyElement(receiver, expectedValue, true);
  Expect.isTrue(tested.length > 0);
  Expect.equals(expectedValue, tested[tested.length - 1]);
  if (tested.length > 1) {
    checkTested<int>(tested, expectedValue);
  }
}

main() {
  for (int i = 0; i < 4; i++) {
    check(i);
  }
}
