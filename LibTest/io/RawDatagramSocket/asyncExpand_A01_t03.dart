/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<E> asyncExpand<E>(Stream<E> convert(T event))
 * Transforms each element into a sequence of asynchronous events.
 *
 * Returns a new stream and for each event of this stream, do the following:
 *
 * - If the event is an error event or a done event, it is emitted directly by
 *   the returned stream.
 * - Otherwise it is an element. Then the convert function is called with the
 *   element as argument to produce a convert-stream for the element.
 * - If that call throws, the error is emitted on the returned stream.
 * - . . .
 * - Otherwise, this stream is paused and convert-stream is listened to. Every
 *   data and error event of the convert-stream is emitted on the returned
 *   stream in the order it is produced. When the convert-stream ends, this
 *   stream is resumed.
 *
 * @description Checks that the convert function is called with the element as
 * argument to produce a convert-stream for the element, and a convert-stream
 * is emitted on the returned stream in the order it is produced.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> check(int variant) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  List received = [];
  Completer<List> completer = new Completer<List>();
  Future<List> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  var dg;
  Stream s;
  if (variant == 0) {
    s = receiver.asyncExpand((e) => new Stream.fromIterable(
        [(dg = receiver.receive()) == null ? e : dg.data[0]]));
  } else {
    s = receiver.asyncExpand((e) => new Stream.fromIterable([
        (dg = receiver.receive()) == null ? e : dg.data[0],
        dg == null ? e : dg.data[0]
    ]));
  }
  s.listen((value) {
    received.add(value);
  }).onDone(() {
    if (!completer.isCompleted) {
      completer.complete(received);
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
  int attempts4asyncExpand = 5;

  toCheck(int variant, int expectedLen, int multiplier) async {
    List expectedValues = [0, 1, 2, RawSocketEvent.closed];
    for (int i = 0; i < attempts4asyncExpand; i++) {
      List list = await check(variant);
      int listLen = list.length;
      if (listLen == 0) {
        continue;
      }
      if (listLen >= multiplier && listLen <= expectedLen) {
        for (int i = 0; i < list.length; i += multiplier) {
          Expect.isTrue(
              expectedValues.contains(list[i]), "Unexpected value ${list[i]}");
          if (multiplier == 2) {
            Expect.equals(list[i], list[i + 1]);
          }
        }
        break;
      }
      if (listLen > expectedLen) {
        Expect.fail("$listLen elements found instead of $expectedLen.");
      }
      if (i == attempts4asyncExpand - 1) {
        print('$listLen elements found. Look like test failed.');
      }
    }
  }

  toCheck(0, 4, 1);
  toCheck(1, 8, 2);
}
