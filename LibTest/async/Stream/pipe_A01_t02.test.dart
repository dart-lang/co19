/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 * Pipe the events of this stream into streamConsumer.
 * @description Checks that all events (including errors) of this stream are
 * piped through streamConsumer
 * @author a.semenov@unipro.ru
 */
library pipe_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

class TestStreamConsumer<T> implements StreamConsumer<T> {

  StreamController _controller = new StreamController();

  Future addStream(Stream<T> source) {
    return _controller.addStream(source, cancelOnError:false);
  }

  Future close() {
    return _controller.close();
  }

  Stream get stream => _controller.stream;
}

void test(CreateStreamWithErrorsFunction create) {
  List values = [];
  List errors = [];
  TestStreamConsumer<int> c = new TestStreamConsumer<int>();

  c.stream.listen(
    (x) {
      values.add(x);
    },
    onError:(error) {
      errors.add(error);
    }
  );

  Stream<int> s = create([1, 2, 3, 4, 5], isError:(x) => x.isEven);

  asyncStart();
  s.pipe(c).then((x) {
    Expect.listEquals([1, 3, 5], values);
    Expect.listEquals([2, 4], errors);
    asyncEnd();
  });
}
