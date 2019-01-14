/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Datagram receive()
 * Receive a datagram. If there are no datagrams available null is returned.
 *
 * @description Checks that method receive receives datagrams.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3, 4], [5, 6, 7], [8, 9], [10]];

  if (!await sendDatagram(producer, toSend, localhost, receiver.port)) {
    Expect.fail("No datagram was sent.");
  }

  List<List<int>> received = await receiveDatagram(receiver);
  compareReceivedData(toSend, received);
  Expect.isTrue(received.length > 0);
}
