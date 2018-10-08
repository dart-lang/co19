/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * If this stream is empty (a done event occurs before the first data event),
 * the resulting future completes with a StateError.
 * @description Checks that future completes with a StateError when this
 * stream is empty.
 * @author a.semenov@unipro.ru
 */
library last_A02_t01;
import "../../../Utils/expect.dart";

void test(var create) {
  AsyncExpect.error((e) => e is StateError, create([]).then((s) => s.last));
}
