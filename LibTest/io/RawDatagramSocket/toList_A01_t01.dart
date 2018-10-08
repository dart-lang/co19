/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<RawSocketEvent>> toList ()
 * Collects all elements of this stream in a List.
 *
 * Creates a List<T> and adds all elements of the stream to the list in the
 * order they arrive. When the stream ends, the returned future is completed
 * with that list.
 *
 * @description Checks that method [toList] collects all elements of this stream
 * in a List and returns future completed with that list when the stream ends.
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

      Future fList = receiver.toList();
      fList.then((list) {
        Expect.listEquals(dataExpected, list);
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
