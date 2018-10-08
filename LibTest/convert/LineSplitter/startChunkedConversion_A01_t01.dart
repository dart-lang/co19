/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sink startChunkedConversion(Sink sink)
 * Starts a chunked conversion.
 *
 * The returned sink serves as input for the long-running conversion. The given
 * sink serves as output.
 * @description Checks that this method starts a chunked conversion.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String str) {
  LineSplitter ls = new LineSplitter();
  bool called = false;

  Sink<String> outSink = new ChunkedConversionSink.withCallback((chunks) {
    Expect.listEquals(ls.convert(str), chunks);
    called = true;
  });
  var inSink = ls.startChunkedConversion(outSink);
  inSink.add(str);
  inSink.close();
  Expect.isTrue(called);
}

main() {
  check("aa\nbb\rcc\r\ndd");
  check("aaa\nbbb");
  check("aaa\nbbb\rc");
  check("aaa\nbbb\r\nc");
  check("aaa\fbbb\r\nc");
  check("\n\r\n\n\r\r\r");
}
