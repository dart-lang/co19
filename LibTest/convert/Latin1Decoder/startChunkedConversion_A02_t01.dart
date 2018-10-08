/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteConversionSink startChunkedConversion(Sink<String> sink)
 * Starts a chunked conversion.
 *
 * The returned sink serves as input for the long-running conversion. The given
 * sink serves as output.
 * @description Checks that more than one object can be passed into the returned
 * sink
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String str) {
  List<int> data = latin1.encode(str);
  Latin1Decoder decoder = new Latin1Decoder();
  bool called = false;

  var outSink = new StringConversionSink.withCallback((chunks) {
    Expect.equals(str + str, chunks);
    called = true;
  });
  var inSink = decoder.startChunkedConversion(outSink);
  inSink.add(data);
  inSink.add(data);
  inSink.close();
  Expect.isTrue(called);
}

main() {
  for (int i = 0; i < 256; i++) {
    check(new String.fromCharCode(i));
  }
  check("");
}
