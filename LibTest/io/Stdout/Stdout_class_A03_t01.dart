/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion CLASS  Stdout
 * In some situations this blocking behavior is undesirable as it does not
 * provide the same non-blocking behavior as [dart:io] in general exposes. Use
 * the property [nonBlocking] to get an [IOSink] which has the non-blocking
 * behavior.
 * @description Checks that stream is not blocked if [nonBlocking] [IOSink] is
 * used.
 * @author iarkh@unipro.ru
 */

import "dart:async";
import "dart:io";

bool called = false;

Stream<List> stream1 = new Stream<List>.fromIterable(
    [[1, 2, 3, 4, 5], [12], [3, 22]]);
Stream<List> stream2 = new Stream<List>.fromIterable(
    [[1, 2, 3, 4, 5], [12], [3, 22]]);

test(Stdout sink, Stream<List> stream) async {
  sink.nonBlocking.addStream(stream).then((x) {
    new Future.delayed(new Duration(seconds: 3)).then((_) {});
  });
  sink.writeln();
  sink.writeAll([1, 2, 48, "abc"], ",");
  sink.write("This is a test");
  sink.writeln("This is a test1");
  sink.add([1, 2, 3]);
}

main() async {
  test(stdout, stream1);
  test(stderr, stream2);
}
