/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Datagram receive()
 * Receive a datagram.
 * . . .
 * The maximum length of the datagram that can be received is 65503 bytes.
 *
 * @description Checks that the 65503 bytes datagram can be received.
 * @issue 31733
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;
int sentLength = 65503;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<int> sList = new List<int>(sentLength);
  for (int i = 0; i < sentLength; i++) {
    sList[i] = i & 0xff;
  }
  List<List<int>> toSend = [sList];
  bool sent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(sent);

  List<List<int>> received = await receiveDatagram(receiver);
  if (received.length > 0) {
    Expect.listEquals(toSend, received);
  }
}
