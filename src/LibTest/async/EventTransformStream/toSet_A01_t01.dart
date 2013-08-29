/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<T>> toList()
 * Collects the data of this stream in a List.
 * @description Checks that returned set contains all elements of the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer {
  void handleData(var event, EventSink sink) {
    sink.add(event);
  }
}

/** index - first position in the stream where test() returns false
 */
void check(List data) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  Future f=ets.toSet();
  asyncStart();
  f.then((Set value){
      Expect.setEquals(data, value);
      asyncEnd();
    });
}

main() {
  check([]);
  check([-1,-2,-3,1,2,3-1,-2,-3]);
  check([1,2,3]);
  check([[],[[]],[[[]]]]);
  check(["1",2,null]);
}

