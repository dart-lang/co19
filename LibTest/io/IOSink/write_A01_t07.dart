/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [toString] is called when writing object to the
 * consumer
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

int called = 0;
int printed = 0;

String str = "I am here";
List<int> res = [73, 32, 97, 109, 32, 104, 101, 114, 101];

class ObjectToPass {
  String toString() {
    called++;
    return str;
  }
}

class MyStreamConsumer<List> extends StreamConsumer<List> {
  Future close() { return new Future(() {}); }
  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      printed++;
      Expect.listEquals(res, x.first);
    });
    return new Future(() {});
  }
}

test() async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink = new IOSink(consumer);
  sink.write(new ObjectToPass());
  await sink.flush();
  Expect.equals(1, called);
  Expect.equals(1, printed);
}

main() { test(); }