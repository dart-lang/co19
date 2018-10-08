/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 *
 * The returned stream provides the same events as this stream, except that it
 * never provides two consecutive data events that are equal. That is, errors
 * are passed through to the returned stream, and data events are passed through
 * if they are distinct from the most recently emitted data event.
 *
 * Equality is determined by the provided equals method. If that is omitted,
 * the '==' operator on the last provided data element is used.
 *
 * If equals throws, the data event is replaced by an error event containing the
 * thrown error. The behavior is equivalent to the original stream emitting the
 * error event, and it doesn't change the what the most recently emitted data
 * event is.
 *
 * @description Checks that the returned stream contains all events when equals
 * is '(previous, next) => false' and this stream contains the equal events.
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
      int counter = 0;
      Timer timer;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream s = receiver.distinct((previous, next) => false);
      s.listen((event) {
        list.add(event);
        receiver.receive();
        counter++;
        if (timer != null) {
          timer.cancel();
        }
        timer = new Timer(const Duration(milliseconds: 200), () {
          Expect.isNull(receiver.receive());
          receiver.close();
        });
      }).onDone(() {
        Expect.equals(4, counter);
        Expect.listEquals(expected, list);
        asyncEnd();
      });
    });
  });
}
