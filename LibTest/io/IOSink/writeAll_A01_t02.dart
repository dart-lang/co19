/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Iterates over the given [objects] and writes them in sequence.
 * @description Check that all the objects are written in the result stream if
 * some encoding was specified.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

int called = 0;

List objects = [
  "Testme",
  123,
  new StackTrace.fromString("Stack trace"),
  [1, 2, 3],
  null,
  "âã"];

List expected = [
  [84, 101, 115, 116, 109, 101],
  [49, 50, 51],
  [83, 116, 97, 99, 107, 32, 116, 114, 97, 99, 101],
  [91, 49, 44, 32, 50, 44, 32, 51, 93],
  [110, 117, 108, 108],
  [0xe2, 0xe3]];

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
  IOSink sink = new IOSink(
      consumer, encoding : Encoding.getByName("iso-8859-1"));
  sink.writeAll(objects);
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}