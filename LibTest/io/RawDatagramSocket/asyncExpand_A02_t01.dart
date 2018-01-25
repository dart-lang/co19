/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<E> asyncExpand<E>(Stream<E> convert(T event))
 * Creates a new stream with the events of a stream per original event.
 * . . .
 * If convert returns null, no value is put on the output stream, just as if it
 * returned an empty stream.
 *
 * @description Checks that if convert returns null, no value is put on the
 * output stream, just as if it returned an empty stream.
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
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      Stream stream = receiver.asyncExpand((e) => null);
      stream.length.then((value){
        Expect.equals(0, value);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
