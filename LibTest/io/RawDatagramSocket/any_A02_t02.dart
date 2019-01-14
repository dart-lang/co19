/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * . . .
 * If the stream ends without finding an element that test accepts, the returned
 * future is completed with false.
 *
 * @description Checks that method any returns false when writeEventsEnabled is
 * true and RawSocketEvent.readClosed is searched. In this case the listening
 * to the stream is stopped after the last received event.
 * @issue 31881
 * @author ngl@unipro.ru
 */
//import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [4]];

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  List<RawSocketEvent> tested =
      await anyElement(receiver, RawSocketEvent.readClosed, false);
  Expect.isTrue(tested.length > 0);
}
