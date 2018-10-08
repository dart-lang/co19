/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * If this stream reports an error, the Future will report that error.
 * @description Checks that if needle is found before this stream reports
 * an error, the returned Future completes with true.
 * @author a.semenov@unipro.ru
 */
library contains_A03_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Error error = new Error();
  Stream s = create([1, error], isError: (e) => e is Error);
  AsyncExpect.value(true, s.contains(1));
}
