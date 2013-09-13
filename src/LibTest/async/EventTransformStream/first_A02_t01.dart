/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * If this is empty throws a StateError.
 * @description Checks that a StateError returned when this is empty.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(Iterable it) {
  Stream stream=new Stream.fromIterable(it);
  MyTransformer t=new MyTransformer();
  EventTransformStream ets=new EventTransformStream(stream, t);
  asyncStart();
  ets.first.then((value) {
      Expect.fail("unexpected call to onValue($value)");
    },
      onError: (Object error) {
      asyncEnd();
    }
  );
}

void main() {
  check([]);
}