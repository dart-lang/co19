/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StringConversionSink startChunkedConversion(Sink<String> sink)
 * Starts a chunked conversion.
 *
 * The returned sink serves as input for the long-running conversion. The given
 * sink serves as output.
 * @description Checks that this method starts a chunked conversion.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  HtmlEscape converter = new HtmlEscape();
  bool called = false;

  Sink<String> outSink = new ChunkedConversionSink.withCallback((chunks) {
    Expect.listEquals([converter.convert("\"&<>'/")], chunks);
    called = true;
  });
  var inSink = converter.startChunkedConversion(outSink);
  inSink.add("\"&<>'/");
  inSink.close();
  Expect.isTrue(called);
}
