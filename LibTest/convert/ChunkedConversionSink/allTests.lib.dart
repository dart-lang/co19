/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class ChunkedConversionSink<T>
 * @description Checks all methods of [ChunkedConversionSink]
 * @author sgrekhov@unipro.ru
 */
library allTests_A01_t01;

import "dart:convert";

import "add_A01_t01.test.dart" as add_A01_t01;
import "add_A01_t02.test.dart" as add_A01_t02;
import "close_A01_t01.test.dart" as close_A01_t01;

test(ChunkedConversionSink create(ChunkedConversionSink<List<int>> outSink)) {
  add_A01_t01.test(create);
  add_A01_t02.test(create);
  close_A01_t01.test(create); //issue 29329
}
