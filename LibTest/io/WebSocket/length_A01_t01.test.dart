/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 *    Counts the elements in the stream.
 * @description Checks that [length] returns number of elements in the stream.
 * @author a.semenov@unipto.ru
 */
library length_A01_t01;
import "../../../Utils/expect.dart";

List<List<int>> BYTES = new List.generate(
    10,
    (int i) => new List.generate(i, (int k) => k*2)
);

void test(var create) {
  AsyncExpect.value(0, create([]).then((s) => s.length));
  AsyncExpect.value(4, create(["1", "2", "3", "null"]).then((s) => s.length));
  AsyncExpect.value(BYTES.length, create(BYTES).then((s) => s.length));
  AsyncExpect.value(2, create([[12,34,56],[78,90]]).then((s) => s.length));
}
