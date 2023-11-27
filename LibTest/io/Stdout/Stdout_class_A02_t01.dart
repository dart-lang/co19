// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CLASS Stdout
/// It provides a blocking [IOSink], so using this to write will block until the
/// output is written.
/// @description Checks that [stdout] is blocked during writing by default.
/// @author iarkh@unipro.ru


import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

bool called = false;

Stream<List<int>> stream1 = new Stream<List<int>>.fromIterable(
    [[1, 2, 3, 4, 5], [12], [3, 22]]);
Stream<List<int>> stream2 = new Stream<List<int>>.fromIterable(
    [[1, 2, 3, 4, 5], [12], [3, 22]]);

test(Stdout sink, Stream<List<int>> stream) {
  sink.addStream(stream).then((x) {
    new Future.delayed(new Duration(seconds: 3));
  });
  Expect.throws(() { sink.writeln(); }, (e) => e is StateError);
}

main() {
  test(stdout, stream1);
  test(stderr, stream2);
}
