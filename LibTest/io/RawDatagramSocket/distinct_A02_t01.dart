/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 * . . .
 * The returned stream is a broadcast stream if this stream is. If a broadcast
 * stream is listened to more than once, each subscription will individually
 * perform the equals test.
 *
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is, and if a broadcast stream is listened to more than once, each
 * subscription will individually perform the equals test.
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
  List<RawSocketEvent> received1 = [];
  List<RawSocketEvent> received2 = [];
  List<RawSocketEvent> received3 = [];
  List<int> received = [0, 0, 0, 0];
  Completer<List<int>> completer = new Completer<List<int>>();
  Future<List<int>> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream bcs = receiver.asBroadcastStream();
  Expect.isTrue(bcs.isBroadcast);
  Stream s = bcs.distinct((previous, next) => previous == next);
  Expect.isTrue(s.isBroadcast);
  s.listen((event) {
    received1.add(event);
  });
  s.listen((event) {
    received2.add(event);
  });
  s.listen((event) {
    received3.add(event);
  });
  bcs.listen((event) {
    receiver.receive();
    received[0]++;
    if (event == RawSocketEvent.closed) {
      if (!completer.isCompleted) {
        completer.complete(received);
      }
    }
  }, onDone: () {
    received[1] = received1.length;
    received[2] = received2.length;
    received[3] = received3.length;
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
  int expectedLen = 3;

  for (int i = 0; i < attempts; i++) {
    List list = await checkDistant();
    if (list[0] == 0 || list[1] == 0 || list[2] == 0 || list[3] == 0) {
      continue;
    }
    if (list[1] > expectedLen ||
        list[2] > expectedLen ||
        list[3] > expectedLen) {
      Expect.fail(
          "Some distinct events ${list.sublist(1)} is greater then $expectedLen.");
    }
    if (list[0] > list[1] && list[0] > list[2] && list[0] > list[3]) {
      break;
    }
    if (i == attempts - 1) {
      print(
          'Received events ${list[0]}, distinct events ${list.sublist(1)}. Look like test failed.');
    }
  }
}
