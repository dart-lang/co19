/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeCharCode(int charCode)
 * Writes the character of [charCode].
 * This method is equivalent to [write(new String.fromCharCode(charCode))].
 * @description Checks that correct char code is written to the result stream.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List<int>> stream) {
    stream.toList().then((x) {
      Expect.equals(10000 * 2, x.length);
      for(int i = 0; i < 10000 * 2; i+=2) {
        Expect.listEquals(x[i + 1], x[i]);
      }
      called++;
    });
    return new Future(() {});
  }

  Future close() {
    return new Future(() {}).then((x) {});
  }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  for(int i = 0; i < 10000; i++) {
    sink.writeCharCode(i);
    sink.write(new String.fromCharCode(i));
  }
  await sink.close();
  Expect.equals(1, called);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
