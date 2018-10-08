/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 *    Pipe the events of this stream into streamConsumer.
 *    The events of this stream are added to streamConsumer using
 * [StreamConsumer.addStream]. The streamConsumer is closed when this stream
 * has been successfully added to it - when the future returned by addStream
 * completes without an error.
 * @description Checks that streamConsumer is closed when the future returned
 * by addStream completes without an error.
 * @author a.semenov@unipro.ru
 */
library pipe_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

class TestStreamConsumer<T> implements StreamConsumer<T> {

  int _addStreamFutureCompleted = 0;
  int _addStreamFutureCompletedInClose = 0;
  int _closeCallCount = 0;
  StreamController _controller = new StreamController();

  Future addStream(Stream<T> source) {
    return _controller.addStream(source).then(
      (x) {
        _addStreamFutureCompleted++;
        return x;
      }
    );
  }

  Future close() {
    _closeCallCount++;
    _addStreamFutureCompletedInClose = _addStreamFutureCompleted;
    return _controller.close();
  }

  Stream get stream => _controller.stream;
  int get addStreamFutureCompletedInClose => _addStreamFutureCompletedInClose;
  int get closeCallCount => _closeCallCount;
}

void test(CreateStreamFunction create) {
  List values = [];
  TestStreamConsumer<int> c = new TestStreamConsumer<int>();

  c.stream.listen(
    (x) {
      values.add(x);
    }
  );

  Stream<int> s = create([1, 2, 3, 4, 5]);

  asyncStart();
  s.pipe(c).then(
    (x) {
      Expect.listEquals([1, 2, 3, 4, 5], values);
      Expect.equals(1, c.closeCallCount);
      Expect.equals(1, c.addStreamFutureCompletedInClose);
      asyncEnd();
    }
  );
}
