/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] is correctly added to the consumer with
 * [UTF8] encoding.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

bool called = false;

String str = "ащ";
List expected = [0xd0, 0xb0, 0xd1, 0x89];

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.listEquals(expected, x[0]);
      called = true;
    });
    return new Future(() => "ADD");
  }

  Future close() { return new Future(() => "CLOSE"); }
}

main() async {
  called = false;
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer, encoding: new Utf8Codec());
  await sink.write(str);
  await sink.close();
  Expect.isTrue(called);
}
