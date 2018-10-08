/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 *    If the adding of the stream itself fails in some way, then the consumer
 * is expected to be closed, and won't be closed again. In that case
 * the returned future completes with the error from calling addStream.
 * @description Checks that returned future is completed with error from
 * calling addStream. Also check that StreamConsumer.close is not called.
 * @author a.semenov@unipro.ru
 */
library pipe_A04_t01;
import "dart:async";
import "../../../Utils/expect.dart";

class TestStreamConsumer<T> implements StreamConsumer<T> {
  int _closeCallCount = 0;

  Future addStream(Stream<T> source) {
    return new Future.error("addStreamError");
  }

  Future close() {
    _closeCallCount++;
    return new Future.error("closeError");
  }

  int get closeCallCount => _closeCallCount;
}

void test(CreateStreamFunction create) {
  TestStreamConsumer<int> c = new TestStreamConsumer<int>();
  Stream<int> s = create([1, 2, 3, 4, 5]);

  asyncStart();
  s.pipe(c).then(
      (_) {
        Expect.fail("Returned future should complete with error");
      },
      onError:(e) {
        Expect.equals("addStreamError", e);
        Expect.equals(0, c.closeCallCount);

        asyncEnd();
      }
  );
}
