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
 * @description Checks that combine method is called for each event of stream
 * beginning with the second event.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
   List expected = [
     RawSocketEvent.write,
     RawSocketEvent.read,
     RawSocketEvent.read,
     RawSocketEvent.closed
   ];
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int nCalls = 0;
      int counter = 0;
      List list = [];
      dynamic combine(previous, element) {
        nCalls++;
        list.add(previous);
        list.add(element);
        return element;
      }
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Future future = bcs.reduce(combine);
      future.then((event) {
        Expect.equals(2, nCalls);
        Expect.listEquals(expected, list);
        Expect.equals(RawSocketEvent.closed, event);

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
