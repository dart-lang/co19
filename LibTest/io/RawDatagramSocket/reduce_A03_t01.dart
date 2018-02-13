/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 *
 * @description Checks that the returned future is completed with an error, if
 * method combine throws a error.
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
      int nCalls = 0;
      int counter = 0;
      dynamic combine(previous, element) {
        nCalls++;
        if (nCalls == 2) {
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
