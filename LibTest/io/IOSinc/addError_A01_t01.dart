/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(error, [StackTrace stackTrace])
 * Passes the [error] to the target consumer as an error event.
 * @description Checks that it's impossible to add anything else to consumer
 * after the error appeared.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:typed_data";

bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future<dynamic> addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.fail("Should not be here!");
    }, onError: (error, StackTrace st) {
      called = true;
      Expect.equals("ERROR", error.toString());
    });
    return new Future(() => "ADD");
  }

  Future close() {
    return new Future(() => "CLOSED");
  }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.addError("ERROR");
  sink.add(new Int32List.fromList([1, 2, 3]));
  consumer.close();
  Expect.isTrue(called);
}
