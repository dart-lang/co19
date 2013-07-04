/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> singleWhere(bool test(T element))
 * Finds the single element in this stream matching test.
 * Like lastMatch, except that it is an error if more than one matching element occurs in the stream.
 * @description Checks that the single element is returned.
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

void check(Iterable data, bool test(int element), var expected) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  asyncStart();
  Future f=ets.singleWhere(test);
  f.then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([1,2,3,null], (int element)=>element==null, null);
  check([1,2,3], (int element)=>element>2, 3);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element==30, 30);
}
