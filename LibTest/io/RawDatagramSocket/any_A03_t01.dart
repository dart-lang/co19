/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * . . .
 * If this stream contains an error, or if the call to test throws, the returned
 * future is completed with that error, and processing stops.
 *
 * @description Checks that if the call to test throws, the returned future is
 * completed with that error, and processing stops.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<RawSocketEvent>> anyElement(RawDatagramSocket receiver,
    bool shouldFind, {Duration delay = const Duration(seconds: 2)}) {
  List<RawSocketEvent> tested = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;

  bool test(RawSocketEvent x) {
    tested.add(x);
    if (x == RawSocketEvent.read) {
      throw 11;
    }
    if (receiver?.receive() == null) {
      return true;
    } else {
      return false;
    }
  }

  receiver.any((event) => test(event)).then((value) {
    Expect.fail('Should completed with throw.');
  }).catchError((error) {
    Expect.equals(11, error);
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
      completer.complete(tested);
    }
  });
  return f;
}

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0], [1, 2], [2, 3, 4], [3, 5, 6, 7]];

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  List<RawSocketEvent> tested = await anyElement(receiver, true);
  Expect.isTrue(tested.length <= 2);
  Expect.equals(RawSocketEvent.read, tested[tested.length - 1]);
}
