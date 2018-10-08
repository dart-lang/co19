/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * If this stream reports an error, the Future will report that error.
 * @description Checks that the future reports the instance of the error object
 * which was reported by the stream.
 * @author kaigorodov
 */
library any_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, Object expectedError) {
  AsyncExpect.error(expectedError, stream.any((_) => true));
}

void test(CreateStreamWithErrorsFunction create) {
  Object error = new Error();
  check(create([error], isError:(_) => true), error);

  error = new Exception();
  check(create([error], isError:(_) => true), error);

  check(create([1,2,3], isError: (x) => x.isOdd), 1);
}
