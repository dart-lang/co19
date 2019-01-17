/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<E> asyncMap<E>(FutureOr convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
 *
 * This acts like map, except that convert may return a Future, and in that
 * case, the stream waits for that future to complete before continuing with its
 * result.
 *
 * @description Checks that a new stream contains expected events.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> asyncMapAndClose(convert) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];
  List received = [];
  Completer<List> completer = new Completer<List>();
  Future<List> f = completer.future;

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  receiver.close();

  Stream s = receiver.asyncMap(convert);
  s.listen((value) {
    received.add(value);
  }).onDone(() {
    if (!completer.isCompleted) {
      completer.complete(received);
    }
    return f;
  });
  return f;
}

main() async {
  int attempts = 5;
  int expectedLen = 1;

  toCheck(convert, expected) async {
    for (int i = 0; i < attempts; i++) {
      List list = await asyncMapAndClose(convert);
      int listLen = list.length;
      if (listLen == 0) {
        continue;
      }
      if (listLen == expectedLen) {
        if (list[0] is List) {
          Expect.listEquals(expected, list[0]);
        } else {
          Expect.equals(expected, list[0]);
        }
        break;
      }
      if (listLen > expectedLen) {
        Expect.fail("$listLen elements found instead of $expectedLen.");
      }
      if (i == attempts - 1) {
        print('$listLen elements found. Look like test failed.');
      }
    }
  }

  toCheck((e) => e, RawSocketEvent.closed);
  toCheck((e) => [1, 2], [1, 2]);
}
