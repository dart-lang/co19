/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * Adds byte data to the target consumer, ignoring [encoding].
 * The [encoding] does not apply to this method, and the [data] list is passed
 * directly to the target consumer as a stream event.
 * @description Checks that [encoding] does not affect this method call.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

List<int> aList = [310, 320, 330, 340, 350];
int called = 0;

class MyStreamConsumer extends StreamConsumer<List<int>> {
  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.equals(1, x.length);
      Expect.listEquals(aList, x.first);
      called++;
    });
    return new Future(() {});
  }
  Future close() { return new Future(() {}); }
}

test(Encoding enc) async {
  called = 0;
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink;
  sink = (enc == null) ?
    new IOSink(consumer) : new IOSink(consumer, encoding : enc);
  sink.add(aList);
  await sink.close();
  Expect.equals(1, called);
}

main() {
  test(null);
  test(utf8);
  test(ascii);
  test(latin1);
  test(systemEncoding);
}
