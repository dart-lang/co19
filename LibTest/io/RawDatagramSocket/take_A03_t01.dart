/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> take(int count)
 * Provides at most the first count data events of this stream.
 * . . .
 * If this is a broadcast stream, the returned stream is a broadcast stream.
 * In that case, the events are only counted from the time the returned stream
 * is listened to.
 *
 * @description Checks that the events are only counted from the time the
 * returned stream is listened to.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(int n) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      int count = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();

      Stream s = bcs.take(n);
      s.listen((event) {
        count++;
      }, onDone: () {
        Expect.equals(n > 4 ? 4 : n, count);
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
      }).onDone(() {
        Expect.equals(4, counter);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  for (int i = 0; i < 9; i++) {
    check(i);
  }
}
