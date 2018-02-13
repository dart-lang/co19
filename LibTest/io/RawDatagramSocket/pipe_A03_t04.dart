/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 * . . .
 * The returned future completes with the same result as the future returned by
 * StreamConsumer.close. If the adding of the stream itself fails in some way,
 * then the consumer is expected to be closed, and won't be closed again. In
 * that case the returned future completes with the error from calling
 * addStream.
 *
 * @description Checks that the returned future completes with the error from
 * calling addStream when the adding of the stream itself fails, then the
 * consumer is closed, and won't be closed again.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

class LocalStreamConsumer<T> implements StreamConsumer<T> {
  int _addStreamFutureCompleted = 0;
  int _closeCallCount = 0;
  StreamController _controller = new StreamController();

  Future addStream(Stream<T> source) {
    return _controller.addStream(source).then((x) {
      _addStreamFutureCompleted++;
      return new Future.error(9);
    });
  }

  Future close() {
    return _controller.close().then((x) {
      _closeCallCount++;
      return new Future.error(11);
    });
  }

  Stream get stream => _controller.stream;
  int get addStreamFutureCompleted => _addStreamFutureCompleted;
  int get closeCallCount => _closeCallCount;
}

main() {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      List list = [];
      List errList = [];
      LocalStreamConsumer<RawSocketEvent> sc =
          new LocalStreamConsumer<RawSocketEvent>();
      producer.send([sent++], address, receiver.port);
      producer.send([sent], address, receiver.port);
      producer.close();
      receiver.close();

      sc.stream.listen((x) {
        list.add(x);
      });

      Future fValue = receiver.pipe(sc);
      fValue.then((value) {
        Expect.fail('Should not be here. Returned value is error.');
      }).catchError((e) {
        errList.add(e);
      }).whenComplete(() {
        Expect.equals(0, sc.closeCallCount);
        Expect.equals(1, sc.addStreamFutureCompleted);
        Expect.listEquals([RawSocketEvent.CLOSED], list);
        Expect.listEquals([9], errList);
        asyncEnd();
      });
    });
  });
}
