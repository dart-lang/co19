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
 * . . .
 * If a broadcast stream is listened to more than once, each subscription will
 * individually perform the test and handle the error.
 *
 * @description Checks that if a broadcast stream is listened to more than once,
 * each subscription will individually perform the test and handle the error.
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
      List intercepted1 = [];
      List data1 = [];
      List errors1 = [];
      List intercepted2 = [];
      List data2 = [];
      List errors2 = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.skipWhile((e) => throw 11);
      s.handleError((e) {
        intercepted1.add(e);
        throw 12;
      }).listen((d) {
        data1.add(d);
      }, onError: (err) {
        errors1.add(err);
      }, onDone: () {
        Expect.listEquals([11], intercepted1);
        Expect.listEquals([RawSocketEvent.read, RawSocketEvent.closed], data1);
        Expect.listEquals([12], errors1);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(3, counter);
      });

      s.handleError((e) {
        intercepted2.add(e);
        throw 13;
      }).listen((d) {
        data2.add(d);
      }, onError: (err) {
        errors2.add(err);
      }, onDone: () {
        Expect.listEquals([11], intercepted2);
        Expect.listEquals([RawSocketEvent.read, RawSocketEvent.closed], data2);
        Expect.listEquals([13], errors2);
        asyncEnd();
      });
    });
  });
}
