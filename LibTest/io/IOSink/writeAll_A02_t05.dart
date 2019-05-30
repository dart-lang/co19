/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Iterates over the given [objects] and writes them in sequence.
 * @description Check that [separator] does not affect the result output if
 * [objects] contains only one element.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;

List objects = ["Testme"];
List expected = [[84, 101, 115, 116, 109, 101]];

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.equals(expected.length, x.length);
      for (int i = 0; i < expected.length; i++) {
        Expect.listEquals(expected[i], x[i],
            "'" + objects[i].toString() + "' object fails!");
      }
      called++;
    });
    return new Future(() {});
  }

  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.writeAll(objects, ",");
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
