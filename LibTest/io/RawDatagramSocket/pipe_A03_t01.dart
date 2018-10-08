/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<RawSocketEvent> streamConsumer)
 * . . .
 * The returned future completes with the same result as the future returned by
 * StreamConsumer.close. If the call to StreamConsumer.addStream fails in some
 * way, this method fails in the same way.
 *
 * @description Checks that the returned future completes with the same result
 * as the future returned by StreamConsumer.close.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      var rValue = 0;
      List list = [];
      StreamController<RawSocketEvent> sc =
          new StreamController<RawSocketEvent>();
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      sc.stream.listen((x) {
        list.add(x);
      });

      Future fValue = receiver.pipe(sc.sink);
      fValue.then((value) {
        rValue = value;
        Expect.listEquals([RawSocketEvent.closed], list);
      }).whenComplete(() {
        sc.sink.close().then((x) {
          Expect.equals(x, rValue);
        }).whenComplete(() {
          asyncEnd();
        });
      });
    });
  });
}
