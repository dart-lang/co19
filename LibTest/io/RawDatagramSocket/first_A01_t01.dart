/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> first
 * The first element of the stream.
 *
 * Stops listening to the stream after the first element has been received.
 *
 * Internally the method cancels its subscription after the first element.
 * This means that single-subscription (non-broadcast) streams are closed and
 * cannot be reused after a call to this getter.
 *
 * @description Checks that property first returns the first element of the
 * stream and stops listening to the stream after the first element has been
 * received.
 * @author ngl@unipro.ru
 */
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

  Future<RawSocketEvent> firstValue = receiver.first;

  firstValue.then((event) {
    received.add(event);
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

  toCheck(bool removeReceiver) async {
    for (int i = 0; i < attempts; i++) {
      List list = await checkFind(removeReceiver);
      int recLength = list.length;
      if (recLength == 1) {
        break;
      }

      if (i == attempts - 1) {
        print('first element not found. Look like test failed.');
      }
    }
  }

  await toCheck(false);
  await toCheck(true);
}
