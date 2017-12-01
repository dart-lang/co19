/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Close the target consumer.
 * @description Checks that target consumer cannot be closed while stream is
 * being added to the consumer.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    return new Future(() => "ADD");
  }

  Future close() {
    return new Future(() => "CLOSE").then((x) {});
  }
}

main() {
  Stream<List> stream = new Stream<List>.fromIterable([[1, 2], [12], [3, 22]]);
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.addStream(stream).then((x) {
    new Future.delayed(new Duration(seconds: 3)).then((_) {
      sink.close();
    });
  });
  Expect.throws(() {
    sink.close();
  }, (e) => e is StateError);
}
