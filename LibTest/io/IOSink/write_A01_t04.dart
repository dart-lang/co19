/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] is correctly added to the consumer with
 * [utf8] encoding.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

int called = 0;

String str = "ащ";
List expected = [0xd0, 0xb0, 0xd1, 0x89];

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      Expect.listEquals(expected, x[0]);
      called++;
    });
    return new Future((){});
  }

  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer, encoding: utf8);
  sink.write(str);
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}