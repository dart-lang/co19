/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(error, [StackTrace stackTrace])
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that adding [error] after another stream has already been
 * added does not cause [StateError].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      called++;
    }, onError: (error, StackTrace st) {
      Expect.equals("ERROR", error.toString());
    });
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  Stream<List<int>> aStream = new Stream<List<int>>.fromIterable([[1, 2, 3, 4, 5]]);
  await sink.addStream(aStream);
  sink.addError("ERROR");
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}