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

test(Stdout sink) async {
  int called = 0;
  int cnt = 0;
  Stream<List> stream1 = new Stream<List<int>>.fromIterable([[1, 2]]);
  Stream<List> stream2 = new Stream<List<int>>.fromIterable([[12], [3, 22]]);
  Stream<List> stream3 = new Stream<List<int>>.fromIterable([[3, 22]]);
  Stream<List> stream4 = new Stream<List<int>>.fromIterable([[1, 1, 2, 1], [12]]);
  Stream<List> stream5 = new Stream<List<int>>.fromIterable([[1, 2]]);
  await sink.addStream(stream1).then((x) { cnt++; });
  sink.add([0]);
  await sink.addStream(stream2).then((x) { cnt++; });
  sink.write(12);
  await sink.addStream(stream3).then((x) { cnt++; });
  sink.writeln("This is a test");
  sink.writeAll([129, null, 88, "test"]);
  await sink.addStream(stream4).then((x) { cnt++; });
  await sink.addStream(stream5).then((x) { cnt++; });
  sink.writeln("This is a test");
  sink.writeAll([129, null, 88, "test"]);
  sink.writeAll([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
  await sink.flush().then((x) {
    Expect.equals(5, cnt);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  test(stdout);
  test(stderr);
}
