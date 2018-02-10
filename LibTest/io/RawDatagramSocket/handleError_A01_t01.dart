/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 * Creates a wrapper Stream that intercepts some errors from this stream.
 *
 * @description Checks the usage of [handleError] method for instance of
 * RawDatagramSocket.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List intercepted = [];
      List data = [];
      List errors = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      receiver.handleError((e) {
        intercepted.add(e);
      }).listen((d) {
        data.add(d);
      }, onError: (error) {
        errors.add(error);
      }, onDone: () {
        Expect.listEquals([], intercepted);
        Expect.listEquals([RawSocketEvent.CLOSED], data);
        Expect.listEquals([], errors);
        asyncEnd();
      });
    });
  });
}
