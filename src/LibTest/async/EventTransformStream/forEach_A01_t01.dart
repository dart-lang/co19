/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Executes action on each data event of the stream.
 * Completes the returned Future when all events of the stream have been processed.
 * @description Checks that all actions on each data event of the stream are executed.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer {
}

void check(List data) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  List sink=new List();
  asyncStart();
  Future f=ets.forEach((var element){
    sink.add(element);
  });
  f.then((var actual){
    Expect.listEquals(data, sink);
    asyncEnd();
  });
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
