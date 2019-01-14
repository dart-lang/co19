/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Close the datagram socket.
 *
 * @description Checks that if RawDatagramSocket is closed with method close,
 * it does not receive sent events.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<List<int>>> receiveAndClose(RawDatagramSocket receiver,
    {Duration delay = const Duration(seconds: 2)}) {
  List<List<int>> received = [];
  Completer<List<List<int>>> completer = new Completer<List<List<int>>>();
  Future<List<List<int>>> f = completer.future;
  receiver.listen((_event) {
    var datagram = receiver.receive();
    received.add(datagram?.data);
    if (received.length == 1) {
      receiver.close();
    }
    if (_event == RawSocketEvent.closed) {
      if(!completer.isCompleted) {
        completer.complete(received);
      }
    }
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
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3, 4], [5, 6, 7], [8, 9], [10]];

  bool wasSent1 = await sendDatagram(producer, toSend, localhost, receiver.port,
      closeProducer: false);
  Expect.isTrue(wasSent1, "No datagram was sent");

  bool wasSent2 =
    await sendDatagram(producer, [[4], [5]], localhost, receiver.port);
  Expect.isTrue(wasSent2, "No datagram was sent");

  List<List<int>> received = await receiveAndClose(receiver);
  Expect.isTrue(received.length <= 2);
}
