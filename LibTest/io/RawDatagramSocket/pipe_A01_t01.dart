/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 * Pipe the events of this stream into streamConsumer.
 *
 * @description Checks that the stream is piped through streamConsumer.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      List expected = [RawSocketEvent.CLOSED];
      StreamController<RawSocketEvent> sController =
          new StreamController<RawSocketEvent>();
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      sController.stream.listen((x) {
        list.add(x);
      });

      Future fValue = receiver.pipe(sController.sink);
      fValue.then((value) {
        Expect.listEquals(expected, list);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
