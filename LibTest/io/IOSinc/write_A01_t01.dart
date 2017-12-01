/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] is correctly added to the consumer
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

bool called = false;
String str = "I am here";
List<int> res = [73, 32, 97, 109, 32, 104, 101, 114, 101];

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      called = true;
      Expect.listEquals(res, x.first);
    });
    return new Future(() => "ADD");
  }

  Future close() {
    return new Future(() => "CLOSE").then((x) {});
  }
}

main() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.write(str);
  await sink.close();
  Expect.isTrue(called);
}
