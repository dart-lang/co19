/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future flush()
 * Returns a [Future] that completes once all buffered data is accepted by the
 * underlying [StreamConsumer].
 * @description Checks that data is flushed after the [flush] call.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

bool flushed = false;
int cnt = 0;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    return new Future(() => "ADD").then((x) {cnt++; } );
  }

  Future close() {
    return new Future(() => "CLOSE").then((x) {});
  }
}

main() async {
  Stream<List> stream1 = new Stream<List>.fromIterable([[1, 2]]);
  Stream<List> stream2 = new Stream<List>.fromIterable([[12], [3, 22]]);
  Stream<List> stream3 = new Stream<List>.fromIterable([[3, 22]]);
  Stream<List> stream4 = new Stream<List>.fromIterable([[1, 1, 2, 1], [12]]);
  Stream<List> stream5 = new Stream<List>.fromIterable([[1, 2]]);

  StreamConsumer consumer = new MyStreamConsumer();

  IOSink sink = new IOSink(consumer);
  sink.flush();

  await sink.addStream(stream1);
  await sink.addStream(stream2);
  await sink.addStream(stream3);
  await sink.addStream(stream4);
  await sink.addStream(stream5);
  await sink.flush().then((x) {
    Expect.equals(5, cnt);
    flushed = true;
  });
  await sink.close();
  Expect.isTrue(flushed);
}
