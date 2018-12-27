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
//int sentLength = 65504; // Bytes cannot be received (from spec)
//int sentLength = 65508; // Bytes cannot be received in fact (on Linux)
int sentLength = 65537; // Bytes cannot be received in fact (on Windows)


main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<int> sList = new List<int>(sentLength);
  for (int i = 0; i < sentLength; i++) {
    sList[i] = i & 0xff;
  }
  List<List<int>> toSend = [sList];
  List<int> bytesSent =
      await sendDatagramOnce(producer, toSend, localhost, receiver.port);
  if (wasSent(bytesSent)) {
    Expect.isTrue(bytesSent[0] < sentLength);
  }
  producer.close();

  List<List<int>> received = await receiveDatagram(receiver);
  if (received.length > 0){
    for (int i = 0; i < received.length; i++) {
      if (received[i] == null) {
        continue;
      }
      if (bytesSent[i] == sentLength) {
        Expect.fail("$sentLength were received");
      }
    }
  }
}
