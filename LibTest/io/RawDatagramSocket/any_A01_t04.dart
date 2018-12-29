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

Future<List<RawSocketEvent>> anyElement(RawDatagramSocket receiver,
    int expectedCount, {Duration delay = const Duration(seconds: 2)}) {
  List<RawSocketEvent> tested = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;

  bool test(x) {
    tested.add(x);
    receiver.receive();
    if (x == RawSocketEvent.closed) {
      if (!completer.isCompleted) {
        completer.complete(tested);
      }
    }
    return tested.length == expectedCount;
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
    }
  });
  return f;
}

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];

  bool wasSent =
  await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  List<RawSocketEvent> tested = await anyElement(receiver, 2);
  Expect.equals(2, tested.length);
}
