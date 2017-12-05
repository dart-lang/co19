/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Iterates over the given [objects] and writes them in sequence.
 * @description Checks that [writeAll] throws [Error] if [encoding] is [null].
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}
  Future addStream(Stream<List> stream) { return new Future(() => "ADD"); }
  Future close() { return new Future(() => "CLOSE"); }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer, encoding : null);
  Expect.throws(() {
    sink.writeAll(["testme"]);
  }, (e) => e is NoSuchMethodError);
  sink.close();
}
