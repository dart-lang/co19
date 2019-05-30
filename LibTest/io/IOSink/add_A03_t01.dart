/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that calling the [add] when a stream is being added
 * causes error.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";

import "dart:async";
import "dart:io";

bool called = false;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List> stream) {
    stream.toList().then((x) { called = true; });
    return new Future(() {});
  }
  Future close() { return new Future(() {} ); }
}

main() {
  Stream<List> aStream = new Stream<List>.fromIterable([[1, 2, 3, 4, 5]]);
  List<int> aList = [10, 20, 30, 40, 50];
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);

  sink.addStream(aStream).then((x) {
    new Future.delayed(new Duration(seconds: 3)).then((_) {
      sink.close();
    });
  });

  Expect.throws(() { sink.add(aList); }, (e) => e is StateError);
  Expect.isFalse(called);
}
