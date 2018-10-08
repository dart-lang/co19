/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<RawSocketEvent> streamConsumer)
 * . . .
 * All events of this stream are added to streamConsumer using
 * StreamConsumer.addStream. The streamConsumer is closed when this stream has
 * been successfully added to it - when the future returned by addStream
 * completes without an error.
 *
 * Returns a future which completes when the stream has been consumed and the
 * consumer has been closed.
 *
 * @description Checks that the streamConsumer is closed (as StreamController
 * instance is closed) when the future returned by  pipe completes without an
 * error.
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

      Future fValue = receiver.pipe(sc);
      fValue.then((value) {
        Expect.isTrue(sc.isClosed);
        Expect.listEquals([RawSocketEvent.closed], list);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
