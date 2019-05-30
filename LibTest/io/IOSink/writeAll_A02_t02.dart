/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * If [separator] is provided, a [write] with the [separator] is performed
 * between any two elements of objects.
 * @description Check that all the objects are written in the result stream with
 * the provided [separator] which is a long string.
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
  [108, 111, 110, 103, 115, 116, 114, 105, 110, 103],
  [49, 50, 51],
  [108, 111, 110, 103, 115, 116, 114, 105, 110, 103],
  [83, 116, 97, 99, 107, 32, 116, 114, 97, 99, 101],
  [108, 111, 110, 103, 115, 116, 114, 105, 110, 103],
  [91, 49, 44, 32, 50, 44, 32, 51, 93],
  [108, 111, 110, 103, 115, 116, 114, 105, 110, 103],
  [110, 117, 108, 108]];

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      Expect.equals(expected.length, x.length);
      for (int i = 0; i < expected.length; i++) {
        Expect.listEquals(expected[i], x[i]);
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
  sink.writeAll(objects, "longstring");
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
