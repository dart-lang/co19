/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(error, [StackTrace stackTrace])
 * Passes the [error] to the target consumer as an error event.
 * @description Checks that error can be added to the consumer after some other
 * data adding is finished.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future<dynamic> addStream(Stream<List> stream) {
    stream.toList().then((x) {}, onError: (error, StackTrace st) {
      called++;
      Expect.equals("ERROR", error.toString());
    });
    return new Future(() {});
  }
  Future close() { return new Future(() {} ); }
}

test() async {
  List<int> aList = [1, 2, 3, 4, 5];
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.add(aList);
  sink.addError("ERROR");
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}