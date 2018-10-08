/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink(StreamConsumer<List<int>> target,
 *   { Encoding encoding: utf8 })
 * Create an [IOSink] that outputs to a target [StreamConsumer] of bytes.
 * @description Checks that new [IOSink] object with correct encoding is created
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "dart:convert";

main() {
  IOSink sink = new IOSink(new StreamController(), encoding: utf8);
  Expect.equals(utf8, sink.encoding);
  sink.close();

  sink = new IOSink(new StreamController(), encoding: ascii);
  Expect.equals(ascii, sink.encoding);
  sink.close();

  sink = new IOSink(new StreamController(), encoding: latin1);
  Expect.equals(latin1, sink.encoding);
  sink.close();

  sink = new IOSink(new StreamController(), encoding: systemEncoding);
  Expect.equals(systemEncoding, sink.encoding);
  sink.close();

  sink = new IOSink(new StreamController(), encoding: null);
  Expect.isNull(sink.encoding);
  sink.close();
}
