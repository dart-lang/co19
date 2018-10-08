/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * Returns the last element of the stream.
 * @description Checks that the last element is returned.
 * @author a.semenov@unipro.ru
 */
library last_A01_t01;
import "../../../Utils/expect.dart";

void test(var create) {
  AsyncExpect.value("123", create(["123"]).then((s) => s.last));
  AsyncExpect.value("123", create(["aaa", "123"]).then((s) => s.last));
  AsyncExpect.value([123], create([[123]]).then((s) =>s.last));
  AsyncExpect.value([6], create([[123],[45],[6]]).then((s) => s.last));
}
