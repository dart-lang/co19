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
 * @description Checks that this method starts a chunked conversion
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(List<int> codeUnits) {
  String data = base64.encode(codeUnits);
  Base64Encoder encoder = new Base64Encoder();
  bool called = false;

  Sink<String> outSink = new ChunkedConversionSink.withCallback((chunks) {
    Expect.listEquals([data], chunks);
    called = true;
  });
  var inSink = encoder.startChunkedConversion(outSink);
  inSink.add(codeUnits);
  inSink.close();
  Expect.isTrue(called);
}

main() {
  for (int i = 0; i < 256; i++) {
    check([i]);
  }
}
