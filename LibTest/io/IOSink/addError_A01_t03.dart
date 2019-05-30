/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(error, [StackTrace stackTrace])
 * Passes the [error] to the target consumer as an error event.
 * @description Checks that [StackTrace] can be passed to the consumer
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;
StackTrace trace = new StackTrace.fromString("This is a stack trace");

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      Expect.fail("Should not be here!");
    }, onError: (error, StackTrace st) {
      called++;
      Expect.equals("ERROR", error.toString());
      Expect.equals(trace, st);
    });
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.addError("ERROR", trace);
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}