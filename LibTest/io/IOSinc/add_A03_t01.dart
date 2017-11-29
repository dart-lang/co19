/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that calling the [add] function after [assStream] causes
 * error.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:typed_data";

bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  bool isClosed = false;
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) { called = true; });
    return new Future(() => "FAIL");
  }

  Future close() {
    isClosed = true;
    return new Future(() => "CLOSED");
  }
}

main() {
  List<int> list1 = [1, 2, 3, 4, 5];
  Stream<List> aStream = new Stream<List>.fromIterable([list1]);
  Int32List list2 = new Int32List.fromList([10, 20, 30, 40, 50]);
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.addStream(aStream);
  Expect.throws(() {
    sink.add(list2);
    sink.close();
  }, (e) => e is StateError);
  consumer.close();
}
