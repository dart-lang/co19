/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> first
 * The first element of the stream.
 * . . .
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 *
 * @description Checks that getting first is equivalent to this.elementAt(0).
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      var receiver1 = receiver.asBroadcastStream();
      new Timer.periodic(const Duration(microseconds: 1), (timer) {
        if (sent == 3 ) {
          timer.cancel();
          producer.close();
        } else {
          producer.send([sent], address, receiver.port);
          sent++;
        }
      });
      Future.wait(
        [receiver1.elementAt(0), receiver1.first]
      ).then((List result) {
        Expect.equals(result[0], result[1]);
        var value = receiver.receive();
        Expect.notEquals(null, value);
        Expect.equals(0, value.data[0]);
        receiver.close();
        asyncEnd();
      });
    });
  });
}
