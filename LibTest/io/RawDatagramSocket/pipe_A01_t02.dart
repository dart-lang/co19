/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<RawSocketEvent> streamConsumer)
 * Pipe the events of this stream into streamConsumer.
 *
 * @description Checks that all events of this stream are piped through
 * streamConsumer.
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
      List expected = [
        RawSocketEvent.write,
        RawSocketEvent.read,
        RawSocketEvent.read,
        RawSocketEvent.closed
      ];
      StreamController<RawSocketEvent> sController =
          new StreamController<RawSocketEvent>();
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();

      sController.stream.listen((x) {
        list.add(x);
      });

      Stream bcs = receiver.asBroadcastStream();
      Future fValue = bcs.pipe(sController.sink);
      fValue.then((value) {
        Expect.listEquals(expected, list);
      }).whenComplete(() {
        asyncEnd();
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });

      bcs.listen((event) {
        receiver.receive();
      });
    });
  });
}
