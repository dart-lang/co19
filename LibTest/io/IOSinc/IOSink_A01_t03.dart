/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink(StreamConsumer<List<int>> target,
 *   { Encoding encoding: UTF8 })
 * Create an [IOSink] that outputs to a target [StreamConsumer] of bytes.
 * @description Checks that new [IOSink] object with correct encoding is created
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:convert";

main() {
  Encoding enc = new Utf8Codec();
  IOSink sink = new IOSink(new StreamController(), encoding: enc);
  Expect.equals(enc, sink.encoding);
  sink.close();

  enc = new AsciiCodec();
  sink = new IOSink(new StreamController(), encoding: enc);
  Expect.equals(enc, sink.encoding);
  sink.close();

  enc = new Latin1Codec();
  sink = new IOSink(new StreamController(), encoding: enc);
  Expect.equals(enc, sink.encoding);
  sink.close();

  enc = new SystemEncoding();
  sink = new IOSink(new StreamController(), encoding: enc);
  Expect.equals(enc, sink.encoding);
  sink.close();

  sink = new IOSink(new StreamController(), encoding: null);
  Expect.isNull(sink.encoding);
  sink.close();
}
