/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int send(List<int> buffer, InternetAddress address, int port)
 * Send a datagram.
 *
 * Returns the number of bytes written. This will always be either the size of
 * buffer or 0.
 *
 * @description Checks that method send returns 0 if buffer length is 0.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSent = [[], [], []];
  List<int> bytesWritten = await sendDatagramOnce(producer, toSent, localhost,
      receiver.port);
  producer.close();
  Expect.isFalse(wasSent(bytesWritten));
  receiver.close();
}
