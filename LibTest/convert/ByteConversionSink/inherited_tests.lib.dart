/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class ByteConversionSink
 *  extends ChunkedConversionSink<List<int>>
 * @description Checks that all members of [ChunkedConversionSink] are
 * implemented.
 * @author sgrekhov@unipro.ru
 */
library inherited_tests_iterablebase;
import "dart:convert";
import "../ChunkedConversionSink/allTests.lib.dart" as
  chunked_conversion_sink_tests;

test(ChunkedConversionSink create(ChunkedConversionSink<List<int>> outSink)) {
  chunked_conversion_sink_tests.test(create);
}
