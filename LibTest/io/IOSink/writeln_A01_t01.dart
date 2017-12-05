/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts [obj] to a [String] by invoking [Object.toString] and writes the
 * result to [this], followed by a newline.
 * @description Checks that [obj] followed by the newline is written.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

String str = "Testme";
List expected = [[84, 101, 115, 116, 109, 101], [10]];
bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future<dynamic> addStream(Stream<List> stream) {
    stream.toList().then((x) {
      called = true;
      Expect.listEquals(expected[0], x[0]);
      Expect.listEquals(expected[1], x[1]);
    });
    return new Future(() => "OK");
  }

  Future close() { return new Future(() => "CLOSED"); }
}

main() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.writeln(str);
  await sink.close();
  Expect.isTrue(called);
}
