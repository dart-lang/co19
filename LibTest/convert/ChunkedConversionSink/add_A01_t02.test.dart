/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T chunk)
 * Adds chunked data to this sink.
 *
 * This method is also used when converters are used as StreamTransformers.
 * @description Checks that this method adds data to the ChunkedConversionSink.
 * Test chunk modification
 * @author sgrekhov@unipro.ru
 */
library add_A01_t02;

import "dart:convert";
import "../../../Utils/expect.dart";

test(ChunkedConversionSink create(ChunkedConversionSink<List<int>> outSink)) {
  bool called = false;
  Utf8Codec codec = new Utf8Codec();
  var encoded1 = codec.encode("Кириллица");
  var encoded2 = codec.encode("кириллица");
  var outSink = new ChunkedConversionSink<List<int>>.withCallback((accumulated) {
    called = true;
    Expect.listEquals([encoded1, encoded2], accumulated);
  });

  ByteConversionSink inSink = create(outSink);
  var list = utf8.encode("Кириллица");

  Expect.isFalse(called);
  inSink.add(list);
  // Lowercase the first letter (к)
  list[0] = 0xd0;
  list[1] = 0xba;
  inSink.add(list);
  Expect.isFalse(called);
  inSink.close();
  Expect.isTrue(called);
}
