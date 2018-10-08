/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Returns whether needle occurs in the elements provided by this stream.
 *
 * Compares each element of this stream to needle using Object.==. If an equal
 * element is found, the returned future is completed with true. If the stream
 * ends without finding a match, the future is completed with false.
 *
 * @description Checks whether needle occurs in the elements provided by this
 * RawDatagramSocket.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(value, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      Future<bool> b = receiver.contains(value);
      b.then((e) {
        Expect.equals(expected, e);
        asyncEnd();
      });

    });
  });
}

main() {
  check(RawSocketEvent.write, false);
  check(RawSocketEvent.read, false);
  check(RawSocketEvent.closed, true);
  check(RawSocketEvent.readClosed, false);
}
