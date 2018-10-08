/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * If an error event occurs before the last data event, the resulting future
 * is completed with that error.
 * @description Checks that if error event occurs before the last data
 * event, the future completes with that error.
 * @author a.semenov@unipro.ru
 * @issue #30920
 */
library last_A03_t01;
import "../../../Utils/expect.dart";

void test(var create) {
  AsyncExpect.error(
    "error",
    create(["a", "b", "error", "c", "d"], isError: (e) => e == "error").then((s) => s.last)
  );
  AsyncExpect.error(
      "error",
      create(["error", [4], [5]], isError: (e) => e == "error").then((s) => s.last)
  );
  AsyncExpect.error(
      "error",
      create([[1,2], "error"], isError: (e) => e == "error").then((s) => s.last)
  );
}
