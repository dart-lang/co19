/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> first
 * The first element of the stream.
 * . . .
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 *
 * @description Checks that getting first is equivalent to this.elementAt(0).
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";


import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> checkFind(bool removeReceiver) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  Completer<List> completer = new Completer<List>();
  Future<List> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  List received = [];

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");
  if (removeReceiver) {
    receiver.close();
  }

  var bcs = receiver.asBroadcastStream();

  Future.wait(
      [bcs.elementAt(0), bcs.first]
  ).then((List result) {
    received.add(result[0]);
    received.add(result[1]);
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

  toCheck(bool removeReceiver) async {
    for (int i = 0; i < attempts; i++) {
      List list = await checkFind(removeReceiver);
      int recLength = list.length;
      if (recLength == 2 && list[0] == list[1]) {
        break;
      }

      if (i == attempts - 1) {
        print('first not equal to this.elementAt(0). Look like test failed.');
      }
    }
  }

  await toCheck(false);
  await toCheck(true);
}
