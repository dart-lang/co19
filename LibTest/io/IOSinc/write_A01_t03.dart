/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Converts [obj] to a [String] by invoking [Object.toString] and adds the
 * encoding of the result to the target consumer.
 * @description Checks that [String] from latin letters is correctly added to
 * the consumer for any encoding.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

bool called = false;

String str = "Testme";

List encodings = [
  new Utf8Codec(),
  new AsciiCodec(),
  new Latin1Codec(),
  new SystemEncoding()];

List expected = [84, 101, 115, 116, 109, 101];

class MyStreamConsumer<List> extends StreamConsumer<List> {
  MyStreamConsumer() {}

  Future addStream(Stream<List> stream) {
    stream.toList().then((x) {
      Expect.listEquals(expected, x[0]);
      called = true;
    });
    return new Future(() => "ADD");
  }

  Future close() { return new Future(() => "CLOSE"); }
}

main() async {
  encodings.forEach((enc) async {
    called = false;
    StreamConsumer consumer = new MyStreamConsumer();
    IOSink sink = new IOSink(consumer, encoding: enc);
    await sink.write(str);
    await sink.close();
    Expect.isTrue(called);
  });
}
