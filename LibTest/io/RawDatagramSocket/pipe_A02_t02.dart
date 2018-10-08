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
 * @description Checks that the streamConsumer is closed when the future
 * returned by pipe completes without an error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

class LocalStreamConsumer<T> implements StreamConsumer<T> {
  int _addStreamFutureCompleted = 0;
  int _closeCallCount = 0;
  StreamController _controller = new StreamController();

  Future addStream(Stream<T> source) {
    return _controller.addStream(source).then((x) {
      _addStreamFutureCompleted++;
      return x;
    });
  }

  Future close() {
    return _controller.close().then((x) {
      _closeCallCount++;
      return x;
    });
  }

  Stream get stream => _controller.stream;
  int get addStreamFutureCompleted => _addStreamFutureCompleted;
  int get closeCallCount => _closeCallCount;
  StreamController get controller => _controller;
}

main() {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      LocalStreamConsumer<RawSocketEvent> sc =
          new LocalStreamConsumer<RawSocketEvent>();
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      sc.stream.listen((x) {
        list.add(x);
      });

      Future fValue = receiver.pipe(sc);
      fValue.then((value) {
        Expect.isTrue(sc.controller.isClosed);
        Expect.equals(1, sc.closeCallCount);
        Expect.equals(1, sc.addStreamFutureCompleted);
        Expect.listEquals([RawSocketEvent.closed], list);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}
