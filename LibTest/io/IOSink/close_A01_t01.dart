/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Close the target consumer.
 * @description Checks that target consumer gets closed after the [IOSink.close]
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

bool closed = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    return new Future(() => "ADD");
  }

  Future close() {
    return new Future(() => "CLOSE").then((x) { closed = true; });
  }
}

main() async {
  Stream<List> stream = new Stream<List>.fromIterable([[1, 2], [12], [3, 22]]);
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.addStream(stream);
  Expect.isFalse(closed);
  await sink.close();
  Expect.isTrue(closed);
}
