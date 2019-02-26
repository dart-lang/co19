/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 *
 * The returned stream provides the same events as this stream, except that it
 * never provides two consecutive data events that are equal. That is, errors
 * are passed through to the returned stream, and data events are passed through
 * if they are distinct from the most recently emitted data event.
 *
 * Equality is determined by the provided equals method. If that is omitted,
 * the '==' operator on the last provided data element is used.
 *
 * If equals throws, the data event is replaced by an error event containing the
 * thrown error. The behavior is equivalent to the original stream emitting the
 * error event, and it doesn't change the what the most recently emitted data
 * event is.
 *
 * @description Checks that the returned stream contains all events when equals
 * is '(previous, next) => false' and this stream contains the equal events.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> checkDistant() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3], [4, 5], [5]];
  List<RawSocketEvent> received = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream s = receiver.distinct((previous, next) => false);

  s.listen((event) {
    received.add(event);
    receiver.receive();
    if (event == RawSocketEvent.closed) {
      if (!completer.isCompleted) {
        completer.complete(received);
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

main() async {
  int attempts = 5;
  int expectedLen = 7;

  for (int i = 0; i < attempts; i++) {
    List list = await checkDistant();
    int listLen = list.length;
    if (listLen == 0 || listLen == 1) {
      continue;
    }
    if (listLen >= 2 && listLen - 1 <= expectedLen) {
      bool eq2 = false;
      for (int j = 0; j < list.length - 1; j++) {
        if (list[j] == list[j + 1]) {
          eq2 = true;
          break;
        }
      }
      if (eq2) {
        break;
      }
      continue;
    }
    if (listLen > expectedLen) {
      Expect.fail("$listLen elements found instead of $expectedLen.");
    }
    if (i == attempts - 1) {
      print('Equal elements not found. Look like test failed.');
    }
  }
}
