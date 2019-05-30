/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * ...
 * The data list should not be modified after it has been passed to add.
 * @description Checks that the data list should not be modified after it has
 * been passed to add.
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";

import "dart:async";
import "dart:io";

int callCounter = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {

  Future addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      callCounter++;
      Expect.listEquals([[0, 1, 4, 1, 5, 9]], x);
      asyncEnd();
    });
    return new Future(() {});
  }

  Future close() { return new Future(() {}); }
}

test() async {
  List<int> data = [3, 1, 4, 1, 5];
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.add(data);
  data.add(9);
  data[0] = 0;
  await sink.close();
  Expect.equals(1, callCounter);
}

main() {
  asyncStart();
  test();
}
