/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> handleError(
 *     Function onError, {
 *     bool test(error)
 * })
 * Creates a wrapper Stream that intercepts some errors from this stream.
 *
 * @description Checks the usage of [handleError] method for instance of
 * RawDatagramSocket.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List intercepted = [];
      List data = [];
      List errors = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      bcs.handleError((e) {
        intercepted.add(e);
      }).listen((d) {
        data.add(d);
      }, onError: (err) {
        errors.add(err);
      }, onDone: () {
        Expect.listEquals([], intercepted);
        Expect.listEquals([
          RawSocketEvent.write,
          RawSocketEvent.read,
          RawSocketEvent.read,
          RawSocketEvent.closed
        ], data);
        Expect.listEquals([], errors);
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
      });
    });
  });
}
