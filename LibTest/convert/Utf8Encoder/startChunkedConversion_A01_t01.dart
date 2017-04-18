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
 * @description Checks that this method transforms stream's events
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String str) {
  Utf8Encoder encoder = new Utf8Encoder();
  bool called = false;

  Sink<List<int>> outSink = new ChunkedConversionSink.withCallback((chunks) {
    Expect.listEquals([encoder.convert(str)], chunks);
    called = true;
  });
  var inSink = encoder.startChunkedConversion(outSink);
  inSink.add(str);
  inSink.close();
  Expect.isTrue(called);
}

main() {
  for (int i = 0; i < 128; i++) {
    check(new String.fromCharCode(i));
  }
  check("Кириллица прекрасна");
}
