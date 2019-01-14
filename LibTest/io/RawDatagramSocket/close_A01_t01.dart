/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Close the datagram socket.
 *
 * @description Checks that method close closes the datagram socket.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<int> toSend = [1, 2];
  receiver.close();

  try {
    Expect.throws(() {
      producer.send(toSend, localhost, receiver.port);
    }, (e) => e is SocketException);
  } finally {
    producer.close();
  }
}
