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
 * @description Checks that the 65504 bytes datagram can not be received.
 * @author ngl@unipro.ru
 * @issue 31733
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;
int datagramLength = 65504;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<int> sList = new List<int>(datagramLength);
  for (int i = 0; i < datagramLength; i++) {
    sList[i] = i & 0xff;
  }
  List<List<int>> toSend = [sList];
  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  List<List<int>> received = await receiveDatagram(receiver);
  if (received.length > 0){
    for (int i = 0; i < received.length; i++) {
      if (received[i] == null) {
        continue;
      }
      Expect.notEquals(datagramLength, received[i].length,
          "Wrong length of the datagram received");
    }
  }
}
