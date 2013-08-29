/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future fold(initialValue, combine(previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that the result is correct.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(Iterable data, initialValue, combine(previous, var element), var expected) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  asyncStart();
  Future f=ets.fold(initialValue, combine);
  f.then((var actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([1,2,3,4], 0, (int previous, int element)=>previous+element, 10);
  check([1,2,3,4], 1, (int previous, int element)=>previous*element, 24);
  check([1,2,3,4], false, (bool previous, int element)=>previous||(element==2), true);
}
