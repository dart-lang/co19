/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * If this is empty throws a StateError.
 * Otherwise this method is equivalent to this.elementAt(0).
 * @description Checks that this method is equivalent to this.elementAt(0).
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
  EventTransformStream ets=new EventTransformStream(stream, t).asBroadcastStream();
  
  Sync2 sync=new Sync2((v1, v2) {
    Expect.equals(v1, v2);
  });

  asyncStart();
  ets.first.then((value) {
    sync.put1(value);
    asyncEnd();
  });

  asyncStart();
  ets.elementAt(0).then((value) {
    sync.put2(value);
    asyncEnd();
  });
}

void main() {
  check([null]);
  check([1,2,3]);
}