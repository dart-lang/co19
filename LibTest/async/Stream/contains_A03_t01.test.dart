/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * If this stream reports an error, the Future will report that error.
 * @description Checks that if this stream reports an error, the Future will
 * report that error.
 * @author kaigorodov
 */
library contains_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Error error = new Error();
  Stream s = create([error], isError: (e) => true);
  AsyncExpect.error(error, s.contains(1));
}
