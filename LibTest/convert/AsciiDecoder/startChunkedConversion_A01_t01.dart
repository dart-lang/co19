/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteConversionSink startChunkedConversion(Sink<String> sink)
 * Starts a chunked conversion.
 *
 * The converter works more efficiently if the given sink is a
 * StringConversionSink.
 * @description Checks that this method transforms stream's events
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String str) {
  List<int> data = ascii.encode(str);
  AsciiDecoder decoder = new AsciiDecoder();
  bool called = false;

  var outSink = new StringConversionSink.withCallback((chunks) {
    Expect.equals(str, chunks);
    called = true;
  });
  var inSink = decoder.startChunkedConversion(outSink);
  inSink.add(data);
  inSink.close();
  Expect.isTrue(called);
}

main() {
  for (int i = 0; i < 128; i++) {
    check(new String.fromCharCode(i));
  }
  check("");
}
