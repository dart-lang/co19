/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * If an error event occurs before the first data event, the resulting future
 * is completed with that error.
 * @description Checks that if error event occurs before the first data
 * event, the future completes with that error.
 * @author ilya
 * @author a.semenov@unipro.ru
 */
library last_A03_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Error error = new Error();
  AsyncExpect.error(
    error,
    create([1, 2, error, 4, 5], isError: (e) => e is Error).last
  );
  AsyncExpect.error(
      error,
      create([error, 4, 5], isError: (e) => e is Error).last
  );
  AsyncExpect.error(
      error,
      create([1, 2, error], isError: (e) => e is Error).last
  );
}
