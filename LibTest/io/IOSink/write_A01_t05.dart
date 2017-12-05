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
 * [iso-8859-1] encoding.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

bool called = false;

String str = "âã";
List expected = [0xe2, 0xe3];

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
  IOSink sink = new IOSink(
      consumer, encoding : Encoding.getByName("iso-8859-1"));
  await sink.write(str);
  await sink.close();
  Expect.isTrue(called);
}
