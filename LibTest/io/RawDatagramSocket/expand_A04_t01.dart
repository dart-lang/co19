/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * Creates a new stream from this stream that converts each element into zero
 * or more events.
 * . . .
 * If a broadcast stream is listened to more than once, each subscription will
 * individually call convert and expand the events.
 *
 * @description Checks that if a broadcast stream is listened to more than once,
 * each subscription will individually call convert and expand the events.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(bool secondListen, expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      int n = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      Iterable convert(value) {
        n++;
        return [1];
      }

      Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
      Stream stream = bcs.expand(convert);
      Future l = stream.toList();
      l.then((v) {
        Expect.equals(expected, n);
      });
      if (secondListen) {
        Future l1 = stream.toList();
        l1.then((v) {
          Expect.equals(expected, n);
        });
      }
      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
        asyncEnd();
      });
    });
  });
}

main() {
  check(false, 4);
  check(true, 8);
}
