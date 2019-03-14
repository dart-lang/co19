/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> first
 * The first element of the stream.
 * . . .
 * If an error event occurs before the first data event, the returned future is
 * completed with that error.
 *
 * @description Checks that if an error event occurs before the first data
 * event, the returned future is completed with that error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> checkFind(convert, expected) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  Completer<List> completer = new Completer<List>();
  Future<List> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  List received = [];

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  receiver.expand(convert).first.then((event) {
    Expect.equals(RawSocketEvent.write, event);
    received.add(event);
  }, onError: (error) {
    received.add(error);
  }).whenComplete(() {
    receiver.close();
    if (!completer.isCompleted) {
      completer.complete(received);
    }
    return f;
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

  toCheck(convert, expected) async {
    for (int i = 0; i < attempts; i++) {
      List list = await checkFind(convert, expected);
      int recLength = list.length;
      if (recLength != 1) {
        continue;
      }
      if (list[0].runtimeType == RawSocketEvent  ||  list[0] == expected) {
        break;
      }

      if (i == attempts - 1) {
        print('first element not found. Look like test failed.');
      }
    }
  }

  await toCheck((e) => e == RawSocketEvent.write ? throw 11 : [e], 11);
  await toCheck((e) => e == RawSocketEvent.read ? throw 12 : [e], 12);
  await toCheck((e) => e == RawSocketEvent.closed ? throw 13 : [e], 13);
}
