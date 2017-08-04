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
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> stream, Object expectedError) {
  asyncStart();
  stream.any((_) => true).then(
    (data) {
      Expect.fail("Unexpected data passed: $data");
    },
    onError: (error) {
      Expect.equals(expectedError, error);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  Object error = new Error();
  check(create([error], isError:(_) => true), error);

  error = new Exception();
  check(create([error], isError:(_) => true), error);

  check(create([1,2,3], isError: (x) => x.isOdd), 1);
}
