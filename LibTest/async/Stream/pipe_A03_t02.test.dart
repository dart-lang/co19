/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 *    Returns a future which completes when the stream has been consumed
 * and the consumer has been closed. The returned future completes with
 * the same result as the future returned by StreamConsumer.close.
 * @description Checks that returned future is completed when the stream
 * has been consumed and the consumer has been closed. The returned future
 * completes with the same result as the future returned by StreamConsumer.close.
 * StreamConsumer.close completes with error.
 * @author a.semenov@unipro.ru
 */
library pipe_A03_t02;
import "dart:async";
import "../../../Utils/expect.dart";

class TestStreamConsumer<T> implements StreamConsumer<T> {

  bool _addStreamFutureCompleted = false;
  bool _closeFutureCompleted = false;
  StreamController _controller = new StreamController();

  Future addStream(Stream<T> source) {
    return _controller.addStream(source, cancelOnError:false).then(
        (x) {
          _addStreamFutureCompleted = true;
          return x;
        }
    );
  }

  Future close() {
    return _controller.close().then(
      (_) {
        _closeFutureCompleted = true;
        return new Future.error(3.14);
      }
    );
  }

  Stream get stream => _controller.stream;
  bool get addStreamFutureCompleted => _addStreamFutureCompleted;
  bool get closeFutureCompleted => _closeFutureCompleted;
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
      Expect.fail("Returned future should complete with error");
    },
    onError: (e) {
      Expect.equals(3.14, e);
      Expect.isTrue(c.addStreamFutureCompleted);
      Expect.isTrue(c.closeFutureCompleted);
      Expect.listEquals([1, 2, 3, 4, 5], values);
      asyncEnd();
    }
  );
}
