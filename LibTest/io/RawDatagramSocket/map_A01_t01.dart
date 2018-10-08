/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * Creates a new stream that converts each element of this stream to a new value
 * using the convert function.
 *
 * For each data event, o, in this stream, the returned stream provides a data
 * event with the value convert(o).
 *
 * @description Checks that a new stream contains expected events.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(convert(event), expected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      Stream s = receiver.map(convert);
      s.listen((event) {
        counter++;
        if (event is List) {
          Expect.listEquals(expected, event);
        } else {
          Expect.equals(expected, event);
        }
        if (counter > 1) {
          Expect.fail('counter = $counter. It should be 1.');
        }
      }).onDone(() {
        Expect.equals(1, counter);
        asyncEnd();
      });
    });
  });
}

main() {
  check((e) => e, RawSocketEvent.closed);
  check((e) => [1, 2], [1, 2]);
}
