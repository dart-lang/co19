/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<S> transform <S>(
 *     StreamTransformer<RawSocketEvent, S> streamTransformer
 * )
 * . . .
 * Returns the result of the stream transformation, that is, the result of
 * streamTransformer.bind(this).
 *
 * @description Checks that method [transform] returns the result of the stream
 * transformation, that is, the result of streamTransformer.bind(this).
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

StreamTransformer<RawSocketEvent, RawSocketEvent> transformWithoutChange =
    new StreamTransformer.fromHandlers();

StreamTransformer<RawSocketEvent, int> transformToInt =
    new StreamTransformer.fromHandlers(handleData: (x, sink) {
  sink.add(x == RawSocketEvent.write ? 1 : x == RawSocketEvent.read ? 2 : 3);
});

StreamTransformer<RawSocketEvent, int> transformWithError =
    new StreamTransformer.fromHandlers(handleData: (x, sink) {
  sink.add(
      x == RawSocketEvent.write ? 1 : x == RawSocketEvent.read ? 2 : throw 11);
});

check(transformer, dataExpected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list1 = [];
      List list2 = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.transform(transformer);
      s.listen((event) {
        receiver.receive();
        list1.add(event);
      }, onError: (e) {
        list1.add(e);
      }, onDone: () {
        Expect.listEquals(dataExpected, list1);
        asyncEnd();
      });

      transformer.bind(bcs).listen((event) {
        list2.add(event);
      }, onError: (e) {
        list2.add(e);
      }, onDone: () {
        Expect.listEquals(dataExpected, list2);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
      //    }
    });
  });
}

main() {
  check(transformWithoutChange, [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ]);
  check(transformToInt, [1, 2, 2, 3]);
  check(transformWithError, [1, 2, 2, 11]);
}
