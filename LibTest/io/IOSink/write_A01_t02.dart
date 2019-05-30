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

int called = 0;

List objects = [
  "Testme",
  123,
  new StackTrace.fromString("Stack trace"),
  [1, 2, 3],
  null];

List expected = [
  [84, 101, 115, 116, 109, 101],
  [49, 50, 51],
  [83, 116, 97, 99, 107, 32, 116, 114, 97, 99, 101],
  [91, 49, 44, 32, 50, 44, 32, 51, 93],
  [110, 117, 108, 108]];

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) {
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

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  objects.forEach((x) { sink.write(x); });
  sink.close();
  Expect.equals(1, called );
}
