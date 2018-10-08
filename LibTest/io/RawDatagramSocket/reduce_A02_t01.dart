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
 * Similar to Iterable.reduce, this function maintains a value, starting with
 * the first element of the stream and updated for each further element of this
 * stream. For each element after the first, the value is updated to the result
 * of calling combine with the previous value and the element.
 *
 * @description Checks that if this stream contains only one event, combine
 * method is not called and the returned future is completed with this single
 * event.
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
      List list = [];
      RawSocketEvent combine(RawSocketEvent previous, RawSocketEvent element) {
        nCalls++;
        list.add(previous);
        list.add(element);
        return element;
      }
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();
      receiver.close();

      Future future = receiver.reduce(combine);
      future.then((event) {
        Expect.equals(RawSocketEvent.closed, event);
        Expect.equals(0, nCalls);
        Expect.isTrue(list.isEmpty);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
