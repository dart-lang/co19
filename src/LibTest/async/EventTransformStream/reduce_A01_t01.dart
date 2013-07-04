/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that the result is correct.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
  void handleData(int event, EventSink<int> sink) {
    sink.add(event);
  }
}

void check(Iterable data, combine(previous, var element), var expected) {
  Stream s1=new Stream.fromIterable(data);
  EventTransformStream s2=new EventTransformStream(s1, new MyTransformer());
  asyncStart();
  Future f=s2.reduce(combine);
  f.then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([1,2,3,4], (int previous, int element)=>previous+element, 10);
  check([1,2,3,4], (int previous, int element)=>previous*element, 24);
  check([1,2,3,4], (bool previous, int element)=>previous||(element==2), true);
}
