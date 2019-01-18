/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RawDatagramSocket> bind(
 *    host,
 *    int port, {
 *    bool reuseAddress: true
 * })
 * Creates a new raw datagram socket binding it to an address and port.
 *
 * @description Checks that method bind creates a new raw datagram socket
 * binding it to an address and port.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<List<int>>> sendAndReceive() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3, 4], [5, 6, 7], [8, 9], [10]];

  if (!await sendDatagram(producer, toSend, localhost, receiver.port)) {
    Expect.fail("No datagram was sent.");
  }

  List<List<int>> received = await receiveDatagram(receiver);
  return received;
}

main() async {
  int attempts = 5;
  int expectedLen = 4;

  for (int i = 0; i < attempts; i++) {
    List<List<int>> list = await sendAndReceive();
    int listLen = list.length;
    if (listLen == 0) {
      continue;
    }
    if (listLen > 0 && listLen <= expectedLen) {
      break;
    }
    if (listLen > expectedLen) {
      Expect.fail("$listLen elements found instead of $expectedLen.");
    }
    if (i == attempts - 1) {
      print('$listLen elements found. Look like test failed.');
    }
  }
}
