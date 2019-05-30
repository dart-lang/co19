/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * ...
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * ...
 * @description Checks that calling the [add] function after [addStream] does
 * not cause error if stream adding is finished before the [add] method call.
 * @author iarkh@unipro.ru
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

import "dart:async";
import "dart:io";

int callCounter = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      if(callCounter++ == 0)
        Expect.listEquals([[1, 2, 3, 4, 5]], x);
       else
        Expect.listEquals([[10, 20, 30, 40, 50]], x);
    });
    return new Future(() {});
  }

  Future close() { return new Future(() {}); }
}

test() async {
  Stream<List<int>> aStream = new Stream<List<int>>.fromIterable([[1, 2, 3, 4, 5]]);
  List<int> list2 = [10, 20, 30, 40, 50];
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.addStream(aStream);
  Expect.equals(1, callCounter);
  sink.add(list2);
  sink.close().then((_) {
    Expect.equals(2, callCounter);
    asyncEnd();
  });
}

main() {
  asyncStart();
  test();
}
