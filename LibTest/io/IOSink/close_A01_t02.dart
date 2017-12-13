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

bool closed = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    return new Future(() => "ADD");
  }

  Future close() { return new Future(() => "CLOSE"); }
}

main() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  await sink.close();
  Expect.throws(() { sink.writeln(); }, (e) => e is Error);
}
