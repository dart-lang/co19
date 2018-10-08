/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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

check(String data) {
  JsonDecoder decoder = new JsonDecoder();
  var outSink = new ChunkedConversionSink.withCallback((chunks) {
    Expect.deepEquals(decoder.convert(data), chunks[0]);
  });
  var inSink = decoder.startChunkedConversion(outSink);
  inSink.add(data);
  inSink.close();
}

main() {
  check("123.14");
  check('[[1, 2, 3], {"a": "3"}]');
  check('{"a": "b"}');
}
