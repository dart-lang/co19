/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * NOTE: Writes to the [IOSink] may be buffered, and may not be flushed by a
 * call to close().
 * @description Checks that target consumer can be closed after stream is
 * added to the consumer.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

test(Stdout sink) async {
  int closed = 0;
  Stream<List> stream =
      new Stream<List<int>>.fromIterable([[1, 2], [12], [3, 22]]);
  await sink.addStream(stream).then((x) {
    new Future.delayed(new Duration(seconds: 3)).then((_) { });
  });
  await sink.close().then((_) { closed++; });
  Expect.equals(1, closed);
}

main(List<String> args) {
  test(stdout);
  test(stderr);
}
