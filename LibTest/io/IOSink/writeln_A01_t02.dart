/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeln([Object obj = ""])
 * Converts [obj] to a [String] by invoking [Object.toString] and writes the
 * result to [this], followed by a newline.
 * @description Checks that if [obj] is not specified, just [\n] is written to
 * the result stream.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future<dynamic> addStream(Stream<List> stream) {
    stream.toList().then((x) {
      called = true;
      Expect.equals(1, x.length);
      Expect.listEquals([10], x[0]);
    });
    return new Future(() => "OK");
  }

  Future close() { return new Future(() => "CLOSED"); }
}

main() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.writeln();
  await sink.close();
  Expect.isTrue(called);
}
