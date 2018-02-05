/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 *
 * Stops listening to the stream after the indexth data event has been received.
 *
 * Internally the method cancels its subscription after these elements. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this method.
 *
 * If an error event occurs before the value is found, the future completes with
 * this error.
 *
 * @description Checks that if receiver RawDatagramSocket was listen and closed,
 * method 'elementAt' returns correct value of 0, 1, and 2 indexes.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(int n) {
  List expected = [
    RawSocketEvent.WRITE,
    RawSocketEvent.READ,
    RawSocketEvent.READ
  ];
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Future fValue = receiver.elementAt(n);
      fValue.then((value) {
        Expect.equals(expected[n], value);
      }).catchError((e) {
        Expect.fail('No error should be.');
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  check(0);
  check(1);
  check(2);
}
