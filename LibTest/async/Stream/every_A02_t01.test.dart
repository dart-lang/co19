/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * If this stream reports an error, the Future will report that error.
 * @description Checks that the future reports the instance of the error object
 * which was reported by the stream.
 * @author kaigorodov
 */
library every_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, Object expectedError) {
  AsyncExpect.error(expectedError, s.every((_) => true));
}

void test(CreateStreamWithErrorsFunction create) {
  Object error = new ArgumentError(1);
  check(create([error], isError:(e) => true), error);
  check(create([1, 2, error, 3, 4], isError:(e) => e is ArgumentError), error);
  error = new StateError("");
  check(create([error], isError:(e) => true), error);
  check(create([1, 2, error, 3, 4], isError:(e) => e is StateError), error);
}
