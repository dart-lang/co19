/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 *
 * Calls test on each element of the stream. If the call returns false, the
 * returned future is completed with false and processing stops.
 *
 * If the stream ends without finding an element that test rejects, the returned
 * future is completed with true.
 *
 * @description Checks that [test] accepts the elements provided by this
 * RawDatagramSocket, and if the call returns false, the returned future is
 * completed with false and processing stops, if the stream ends without finding
 * an element that test rejects, the returned future is completed with true.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(nCall) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      int nTestCall = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      bool test(e) {
        nTestCall++;
        if (nTestCall < nCall) {
          return true;
        } else {
          return false;
        }
      }

      Stream<RawSocketEvent> stream = receiver.asBroadcastStream();
      Future<bool> b = stream.every(test);
      bool expected = nCall < 5 ? false : true;
      b.then((value) {
        Expect.equals(expected, value);
        if (!expected) {
          Expect.equals(nCall, nTestCall);
        }
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      stream.listen((event) {
        counter++;
        receiver.receive();
      }).onDone(() {
        Expect.equals(4, counter);
      });
    });
  });
}

main() {
  for (int i = 1; i <= 5; i++) {
    check(i);
  }
}
