/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future fold(initialValue, combine(previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains no elements, the combine method
 * is not called and the future returns initialValue.
 * @note undocumented
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
  f.then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], null, null, null);
  check([], 777, null, 777);
  check([], "", null, "");
}
