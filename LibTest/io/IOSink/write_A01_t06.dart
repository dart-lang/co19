/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] cannot be written if [encoding] is [null].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) { return new Future(() {}); }
  Future close() { return new Future(() {}); }
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer, encoding : null);
  Expect.throws(() { sink.write("testme"); }, (e) => e is NoSuchMethodError);
}
