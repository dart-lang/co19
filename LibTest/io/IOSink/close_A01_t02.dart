/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Close the target consumer.
 * @description Checks that it's impossible to write to the stream after the
 * [IOSink.close] call.
 * @author iarkh@unipro.ru
 * @Issue 29554
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int closed = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) { return new Future(() {}); }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.close();
  Expect.throws(() { sink.writeln(); }, (e) => e is Error);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
