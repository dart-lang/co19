/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
import "dart:typed_data";

Int32List aList = new Int32List.fromList([310, 320, 330, 340, 350]);
bool called = false;

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.equals(1, x.length);
      Expect.listEquals(aList, x.first);
      called = true;
    });
    return new Future(() => "OK");
  }

  Future close() {
    return new Future(() => "CLOSED");
  }
}

test(Encoding enc) async {
  StreamConsumer consumer = new MyStreamConsumer();
  IOSink sink;
  sink = (enc == null) ?
    new IOSink(consumer) : new IOSink(consumer, encoding : enc);
  called = false;
  sink.add(aList);
  await sink.close();
  Expect.isTrue(called);
}

main() {
  test(null);
  test(new Utf8Codec());
  test(new AsciiCodec());
  test(new Latin1Codec());
  test(new SystemEncoding());
}
