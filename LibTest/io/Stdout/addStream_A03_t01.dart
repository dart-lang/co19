/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<List<int>> stream)
 * @description Checks that the [stream] cannot be added if another stream is
 * being added right now.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

test(Stdout sink) {
  Stream<List> stream1 =
      new Stream<List<int>>.fromIterable([[1, 2], [12], [3, 22]]);
  Stream<List> stream2 = new Stream<List<int>>.fromIterable([[0]]);
  sink.addStream(stream1).then((x) {
    new Future.delayed(new Duration(seconds: 3));
  });
  Expect.throws(() {
    sink.addStream(stream2);
  }, (e) => e is StateError);
}

main(List<String> args) {
  test(stdout);
  test(stderr);
}
