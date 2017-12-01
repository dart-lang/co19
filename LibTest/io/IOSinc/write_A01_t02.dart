/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that objects of the different types can be correctly
 * added to the consumer
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

bool called = false;

List objects = ["Testme"];

List expected = [
  [84, 101, 115, 116, 109, 101],
  [49, 50, 56],
  [73, 32, 97, 109, 32, 97, 32, 115, 116, 97, 99, 107, 32, 116, 114, 97, 99, 101],
  [91, 49, 44, 32, 50, 44, 32, 51, 93],
  [110, 117, 108, 108]];

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.equals(expected.length, x.length);
      for (int i = 0; i < expected.length; i++) {
        Expect.listEquals(expected[i], x[i],
            "'" + objects[i].toString() + "' object fails!");
      }
      called = true;
    });
    return new Future(() => "ADD");
  }

  Future close() { return new Future(() => "CLOSE"); }
}

main() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  for (int i = 0; i < expected.length; i++) {
    await sink.write(objects[i]);
  }
  sink.close();
  Expect.isTrue(called);
}
