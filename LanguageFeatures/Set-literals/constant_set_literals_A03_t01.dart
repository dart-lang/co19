/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e1 … en be the constant element expressions of s in source
 * order, and let v1 … vn be their respective constant values. Evaluation of s
 * creates an unmodifiable object implementing Set<T> with v1 … vn as elements.
 * When iterated, the set provides the values in the source order of the
 * original expressions
 *
 * @description Checks that evaluation of s creates an unmodifiable object
 * implementing Set<T> with v1 … vn as elements
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

test(expected, actual) {
  Expect.iterableEquals(expected, actual);
  Expect.throws(() {
    (actual as Set).clear();
  });
}

main() {
  var v1 = const {1, 2 + 1, 3 - 1, };
  test({1, 3, 2}, v1);

  const v2 = {1, 2 + 1, 3 - 1, };
  test({1, 3, 2}, v2);

  const v3 = {'1', '2' + '1', "3 - 1", null,};
  test({'1', '21', '3 - 1', null}, v3);

  var v4 = const {'1', '2' + '1', "3 - 1", null};
  test({'1', '21', '3 - 1', null}, v4);
}
