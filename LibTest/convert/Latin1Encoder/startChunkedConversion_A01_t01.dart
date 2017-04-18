/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sink startChunkedConversion(Sink sink)
 * Starts a chunked conversion.
 *
 * The converter works more efficiently if the given sink is
 * a ByteConversionSink.
 * @description Checks that this method starts a chunked conversion.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String str) {
  Latin1Encoder encoder = new Latin1Encoder();
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
  for (int i = 0; i < 256; i++) {
    check(new String.fromCharCode(i));
  }
  check("");
}
