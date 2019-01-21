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
 * @description Checks that convert may return a Future.
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
  Duration delay = const Duration(seconds: 2);

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream s = receiver.asyncMap(convert);
  s.listen((value) {
    received.add(value);
    receiver.receive();
  });
  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
      completer.complete(received);
    }
  });
  return f;
}

main() async {
  int attempts = 5;
  int expectedLen = 4;

  void toCheck(convert, List expectedValues) async {
    for (int i = 0; i < attempts; i++) {
      List list = await asyncMapAndClose(convert);
      int listLen = list.length;
      if (listLen == 0) {
        continue;
      }
      if (listLen >= 1 && listLen <= expectedLen) {
        for (int i = 0; i < list.length; i++) {
          if (list[i] is List) {
            Expect.listEquals(expectedValues[0], list[i]);
          } else {
            Expect.isTrue(
                expectedValues.contains(list[i]),
                "Unexpected value ${list[i]}");
          }
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

  toCheck((e) => new Future.value(e),
      [RawSocketEvent.write, RawSocketEvent.read]);
  toCheck((e) => new Future.value([1, 2]), [[1, 2]]);
}
