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

List<int> list1 = [10, 20, 30, 40, 50];
List<int> list2 = [1, 2, 3];
List<int> list3 = ([4, 5]);

int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.equals(3, x.length);
      Expect.isTrue(x.contains(list1));
      Expect.isTrue(x.contains(list2));
      Expect.isTrue(x.contains(list3));
      called++;
    });
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.add(list1);
  sink.add(list2);
  sink.add(list3);

  await sink.close();
  Expect.equals(1, called);
}

main() { test(); }
