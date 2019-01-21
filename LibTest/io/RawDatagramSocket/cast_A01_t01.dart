/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<R> cast <R>()
 * Adapt this stream to be a Stream<R>.
 *
 * If this stream already has the desired type, its returned directly. Otherwise
 * it is wrapped as a Stream<R> which checks at run-time that each data event
 * emitted by this stream is also an instance of R.
 *
 * @description Checks that if this stream already has the desired type, its
 * returned directly.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<RawSocketEvent>> check() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];
  List<RawSocketEvent> received = [];
      Completer<List<RawSocketEvent>> completer =
  new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream s = receiver.cast<RawSocketEvent>();
  s.listen((event) {
    received.add(event);
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
  List<RawSocketEvent> expectedValues =
      [RawSocketEvent.write, RawSocketEvent.read];

  checkReceived(check, expectedValues, 4);
}
