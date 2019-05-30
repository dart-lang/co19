/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<List<int>> stream)
 * Adds all elements of the given stream to this.
 * Returns a [Future] that completes when all elements of the given stream are
 * added to this.
 * @description Checks that the [stream] is added to the consumer after the
 * [addStream] method call
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

Stream<List<int>> aStream = new Stream<List<int>>.fromIterable(
    [[1, 2, 3, 4, 5], [12], [3, 22]]);
int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) {
    Expect.equals(aStream, stream);
    called++;
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.addStream(aStream);
  await consumer.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}