/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ABSTRACT CLASS IOSink
 * A combined byte and text output.
 * An [IOSink] combines a [StreamSink] of bytes with a [StringSink], and allows
 * easy output of both bytes and text.
 * Writing text ([write]) and adding bytes ([add]) may be interleaved freely.
 * @description Checks that the different targets can be added and written
 * frequently to the consumer.
 * method call
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

List<int> aList1 = [1, 2, 3, 4, 5];
List<int> aList2 = [11, 23];
String str1 = "I am here";
String str2 = "I am 2";
StackTrace trace = new StackTrace.fromString("I am a stack trace");
List objects = [
  "Testme",
  123,
  new StackTrace.fromString("Stack trace"),
  [1, 2, 3],
  null];

List expected = [
  [73, 32, 97, 109, 32, 104, 101, 114, 101],
  [1, 2, 3, 4, 5],
  [84, 101, 115, 116, 109, 101],
  [49, 50, 51],
  [83, 116, 97, 99, 107, 32, 116, 114, 97, 99, 101],
  [91, 49, 44, 32, 50, 44, 32, 51, 93],
  [110, 117, 108, 108],
  [73, 32, 97, 109, 32, 50],
  [10],
  [11, 23],
  [10]
];

int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.equals(12, x.length);
      for (int i = 0; i < expected.length; i++) {
        Expect.listEquals(expected[i], x[i],
            "'" + x[i].toString() + "' object fails!");
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

  sink.write(str1);
  sink.add(aList1);
  sink.writeAll(objects);
  sink.writeln(str2);
  sink.add(aList2);
  sink.writeln();
  sink.writeCharCode(8);

  await sink.close();
  Expect.equals(1, called);
}

main() { test(); }
