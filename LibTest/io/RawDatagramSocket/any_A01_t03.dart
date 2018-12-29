/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 *
 * Calls test on each element of the stream. If the call returns true, the
 * returned future is completed with true and processing stops.
 *
 * @description Checks that method any returns true when RawSocketEvent.write is
 * searched and writeEventsEnabled is true. In this case the listening to the
 * stream is stopped after the first received RawSocketEvent.write event.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];
  RawSocketEvent findEvent = RawSocketEvent.write;

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  List<RawSocketEvent> tested = await anyElement(receiver, findEvent, true);
  Expect.isTrue(tested.length > 0);
  Expect.equals(findEvent, tested[tested.length - 1]);
  if (tested.length > 1) {
    checkTested<RawSocketEvent>(tested, findEvent);
  }
}
