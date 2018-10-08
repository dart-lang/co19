/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * . . .
 * The returned future is completed with the combined string when the stream is
 * done.
 *
 * @description Checks that the returned future is completed with the combined
 * string when the stream is done.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(n, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int counter = 0;
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future l = bcs.join();
      l.then((value) {
        Expect.equals(expected, value);
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        receiver.receive();
        if (++counter == n) {
          receiver.close();
        }
      });
    });
  });
}

main() {
  check(1, "RawSocketEvent:WRITERawSocketEvent:CLOSED");
  check(2, "RawSocketEvent:WRITERawSocketEvent:READRawSocketEvent:CLOSED");
  check(
      3,
      "RawSocketEvent:WRITERawSocketEvent:READRawSocketEvent:READ"
      "RawSocketEvent:CLOSED");
}
