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

int closed = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) { return new Future(() {}); }
  Future close() { return new Future(() {}).then((x) { closed++; });
  }
}

main() async {
  Stream<List<int>> stream =
  new Stream<List<int>>.fromIterable([[1, 2], [12], [3, 22]]);
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.addStream(stream);
  Expect.equals(0, closed);
  await sink.close();
  Expect.equals(1, closed);
}
