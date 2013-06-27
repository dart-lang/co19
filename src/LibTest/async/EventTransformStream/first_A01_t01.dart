/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * Returns the first element.
 * @description Checks that the first element is returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(Iterable it, var expected) {
  Stream stream=new Stream.fromIterable(it);
  MyTransformer t=new MyTransformer();
  EventTransformStream ets=new EventTransformStream(stream, t);
  asyncStart();
  ets.first.then((value) {
    Expect.equals(expected, value);
    asyncEnd();
  });
}

void main() {
  check([null], null);
  check([1,2,3], 1);
}