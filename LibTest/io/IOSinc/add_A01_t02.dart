/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer.
 * @description Checks that several [List<int>] targets can be added to the
 * consumer
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:typed_data";

Int32List list1 = new Int32List.fromList([10, 20, 30, 40, 50]);
Int32List list2 = new Int32List.fromList([1, 2, 3]);
Int32List list3 = new Int32List.fromList([1, 2, 3]);

bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.listEquals(list1, x[0]);
      Expect.listEquals(list2, x[1]);
      Expect.listEquals(list3, x[2]);
    });
    called = true;
    return new Future(() => "OK");
  }

  Future close() {
    return new Future(() => "CLOSED");
  }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.add(list1);
  sink.add(list2);
  sink.add(list3);

  sink.close();
  consumer.close();

  Expect.isTrue(called);
}
