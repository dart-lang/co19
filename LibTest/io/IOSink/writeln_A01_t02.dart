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

int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      called++;
      Expect.equals(1, x.length);
      Expect.listEquals([10], x[0]);
    });
    return new Future(() {});
  }

  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.writeln();
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
