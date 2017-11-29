/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that calling the several [add] functions does not cause
 * error.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:typed_data";

bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) { called = true; });
    return new Future(() => "OK");
  }

  Future close() {
    return new Future(() => "CLOSED");
  }
}

main() {
  Int32List list1 = new Int32List.fromList([10, 20, 30, 40, 50]);
  Int32List list2 = new Int32List.fromList([1, 2, 3]);
  Int32List list3 = new Int32List.fromList([1, 2, 3]);
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.add(list1);
  sink.add(list2);
  sink.add(list3);

  sink.close();
  consumer.close();
  sink.done.then((x) {
    Expect.equals("CLOSED", x);
  });
}
