/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RawSocketEvent> reduce(
 *     RawSocketEvent combine(T previous, T element)
 * )
 * . . .
 * If this stream emits an error, or the call to combine throws, the returned
 * future is completed with that error, and processing is stopped.
 *
 * @description Checks that if method combine throws an error, the returned
 * future is completed with that error, and processing is stopped.
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
      int nCalls = 0;
      int counter = 0;
      dynamic combine(previous, element) {
        nCalls++;
        if (nCalls == 1) {
          throw nCalls;
        }
        return element;
      }
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Future future = bcs.reduce(combine);
      future.then((event) {
        Expect.fail('Method reduce should be completed with error.');
      }).catchError((error) {
        Expect.equals(nCalls, error);
      }).whenComplete(() {
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
      }).onDone(() {
        Expect.equals(3, counter);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}
