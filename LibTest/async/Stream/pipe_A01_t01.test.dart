/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future pipe(StreamConsumer<T> streamConsumer)
 * Pipe the events of this stream into streamConsumer.
 * @description Checks that this stream is piped through streamConsumer
 * @author ilya
 */
library pipe_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  List values = [];
  StreamController<int> c = new StreamController<int>();

  c.stream.listen((x) {
    values.add(x);
  });

  Stream<int> s = create([1, 2, 3]);

  asyncStart();
  s.pipe(c.sink).then((x) {
    Expect.listEquals([1, 2, 3], values);
    asyncEnd();
  });
}
