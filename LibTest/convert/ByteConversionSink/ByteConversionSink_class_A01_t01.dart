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
 * @description Checks that this method adds data to the [ByteConversionSink]
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "allTests.lib.dart" as all_tests;

ByteConversionSink create(ChunkedConversionSink outSink) {
  Sink<String> sink = outSink as Sink<String>;
  return utf8.decoder.startChunkedConversion(sink);
}

main() {
  all_tests.test(create);
}