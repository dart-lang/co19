/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<Set<RawSocketEvent>> toSet ()
 * Collects the data of this stream in a Set.
 *
 * The returned set is the same type as returned by new Set<T>().
 *
 * @description Checks that method [toSet] collects the data of this stream in
 * a Set.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(dataExpected, [bool no_write_events = false]) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      if (no_write_events) {
        receiver.writeEventsEnabled = false;
      }
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();
      receiver.close();

      Future fSet = receiver.toSet();
      fSet.then((set) {
        Expect.setEquals(dataExpected, set);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}

main() {
  check([RawSocketEvent.closed]);
  check([RawSocketEvent.closed], true);
}
