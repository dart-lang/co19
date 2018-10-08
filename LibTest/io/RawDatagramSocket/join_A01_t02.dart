/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Combines the string representation of elements into a single string.
 *
 * Each element is converted to a string using its Object.toString method. If
 * separator is provided, it is inserted between element string representations.
 *
 * @description Checks that if separator is provided, it is inserted between any
 * two elements.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(separator, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Future l = bcs.join(separator);
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
      });
    });
  });
}

main() {
  String sep() => "--";
  check("", "RawSocketEvent:WRITERawSocketEvent:READRawSocketEvent:CLOSED");
  check(
      ", ", "RawSocketEvent:WRITE, RawSocketEvent:READ, RawSocketEvent:CLOSED");
  check(
      "11", "RawSocketEvent:WRITE11RawSocketEvent:READ11RawSocketEvent:CLOSED");
  check(sep(),
      "RawSocketEvent:WRITE--RawSocketEvent:READ--RawSocketEvent:CLOSED");
  check(null,
      "RawSocketEvent:WRITEnullRawSocketEvent:READnullRawSocketEvent:CLOSED");
}
