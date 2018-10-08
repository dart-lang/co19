/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> elementAt(int index)
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
 * @description Checks that if receiver RawDatagramSocket receives sent events,
 * method 'elementAt' returns correct value of 0, 1, 2, and 3 indexes.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(int n) {
  List expected = [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      Timer timer;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Future fValue = bcs.elementAt(n);
      fValue.then((value) {
        Expect.equals(expected[n], value);
      }).catchError((e) {
        Expect.fail('No error should be.');
      }).whenComplete(() {
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      });
    });
  });
}

main() {
  check(0);
  check(1);
  check(2);
  check(3);
}
