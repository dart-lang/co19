/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * If [separator] is provided, a [write] with the [separator] is performed
 * between any two elements of objects.
 * @description Check that [writeAll] causes [Error] if [separator] is set to
 * [null].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List> stream) { return new Future(() {}); }
  Future close() { return new Future(() {}); }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  Expect.throws(() {
    sink.writeAll([1, 2], null);
  }, (e) => e is NoSuchMethodError);
  sink.close();
}
