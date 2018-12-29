/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Datagram receive()
 * Receive a datagram. If there are no datagrams available null is returned.
 *
 * @description Checks that RawSocketEvent.closed event does not have datagram
 * and method receive returns null in this case.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<List<int>>> receiveClosed(RawDatagramSocket receiver,
    {Duration delay = const Duration(seconds: 2), RawSocketEvent event}) {
  List<List<int>> received = [];
  Completer<List<List<int>>> completer = new Completer<List<List<int>>>();
  Future<List<List<int>>> f = completer.future;
  receiver.listen((_event) {
    var datagram = receiver.receive();
    if (_event == event) {
      received.add(datagram == null ? null : datagram.data);
    }
    if (_event == RawSocketEvent.closed) {
      if(!completer.isCompleted) {
        completer.complete(received);
      }
    }
  });
  new Future.delayed(delay, () {
    receiver.close();
  });
  return f;
}

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [];
  List<int> bytesSent =
      await sendDatagramOnce(producer, toSend, localhost, receiver.port);
  producer.close();

  List<List<int>> received =
      await receiveClosed(receiver, event: RawSocketEvent.closed);
  if (received.isNotEmpty) {
    Expect.equals(received[0], null);
  }
}
