/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<List<int>> stream)
 * Adds all elements of the given stream to this.
 * @description Checks that the target is added to the consumer after the [add]
 * method call
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:typed_data";

Stream<List> aStream = new Stream.fromIterable(new Int32List(5));
bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  bool isClosed = false;
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    Expect.equals(aStream, stream);
    called = true;
    return new Future(() => "OK");
  }

  Future close() {
    isClosed = true;
    return new Future(() => "CLOSED");
  }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);

  sink.addStream(aStream);
  consumer.close();
  Expect.isTrue(called);
}
