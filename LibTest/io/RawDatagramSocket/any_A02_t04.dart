/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * . . .
 * If the stream ends without finding an element that test accepts, the returned
 * future is completed with false.
 *
 * @description Checks that if the stream ends without finding an element that
 * test accepts, the returned future is completed with false.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<RawSocketEvent>> anyElement(RawDatagramSocket receiver,
    RawSocketEvent expectedEvent,
    {Duration delay = const Duration(seconds: 2)}) {
  List<RawSocketEvent> tested = [];
  Completer<List<RawSocketEvent>> completer =
  new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Stream bcs = receiver.asBroadcastStream();

  bool test(x) {
    tested.add(x);
    return x == expectedEvent;
  }

  bcs.any((event) => test(event)).then((value) {
    Expect.equals(false, value);
  });

  bcs.listen((event) {
    receiver.receive();
    if (event == RawSocketEvent.closed) {
      if (!completer.isCompleted) {
        completer.complete(tested);
      }
    }
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
    }
  });
  return f;
}

check(RawSocketEvent expectedEvent, [bool no_write_events = false]) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];
  if (no_write_events) {
    receiver.writeEventsEnabled = false;
  }

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  List<RawSocketEvent> tested = await anyElement(receiver, expectedEvent);
  Expect.isTrue(tested.length > 0);
}

main() {
  check(RawSocketEvent.write, true);
  check(RawSocketEvent.readClosed);
  check(RawSocketEvent.readClosed, true);
}
