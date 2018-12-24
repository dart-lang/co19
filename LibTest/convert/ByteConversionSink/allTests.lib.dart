/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class ByteConversionSink
 *  extends ChunkedConversionSink<List<int>>
 * @description Checks all methods of [ByteConversionSink]
 * @author sgrekhov@unipro.ru
 */
library allTests_A01_t01;

import "dart:convert";

import "addSlice_A01_t01.test.dart" as addSlice_A01_t01;
import "addSlice_A01_t02.test.dart" as addSlice_A01_t02;
import "addSlice_A01_t03.test.dart" as addSlice_A01_t03;
import "inherited_tests.lib.dart" as inherited_tests;

test(ChunkedConversionSink create(ChunkedConversionSink<List<int>> outSink)) {
  addSlice_A01_t01.test(create);
  addSlice_A01_t02.test(create);
  addSlice_A01_t03.test(create);
  inherited_tests.test(create);
}
