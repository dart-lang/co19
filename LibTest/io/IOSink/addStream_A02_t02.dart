/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<List<int>> stream)
 * @description Checks that the [stream] can be added is another stream has been
 * already added.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

Stream<List> stream1 = new Stream<List>.fromIterable([[1, 2], [12], [3, 22]]);
Stream<List> stream2 = new Stream<List>.fromIterable([[0]]);
int called = 0;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  Future addStream(Stream<List> stream) {
    called++;
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.addStream(stream1);
  await sink.addStream(stream2);
  await sink.close();
  Expect.equals(2, called);
}

main() { test(); }