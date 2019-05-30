/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Writes the character of [charCode].
 * This method is equivalent to [write(new String.fromCharCode(charCode))].
 * @description Checks that [writeCharCode] does not accept negative and too big
 * values.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) { return new Future((){}); }
  Future close() { return new Future(() {}); }
}

void testNegative(IOSink sink, int i) {
  Expect.throws(() { sink.writeCharCode(i); }, (e) => e is RangeError);
  Expect.throws(() {
    sink.write(new String.fromCharCode(i));
  }, (e) => e is RangeError);
}

main() {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  testNegative(sink, -1);
  testNegative(sink, -2045);
  testNegative(sink, 1114112);
  testNegative(sink, 1000000000);

  sink.close();
}
