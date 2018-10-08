/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink(StreamConsumer<List<int>> target,
 *   { Encoding encoding: utf8 })
 * Create an [IOSink] that outputs to a target [StreamConsumer] of bytes.
 * @description Checks that new [IOSink] object is created
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  dynamic sink = new IOSink(new StreamController());
  Expect.isTrue(sink is IOSink);
  sink.close();
}
