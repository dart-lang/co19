/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This enables in-place literals (which aren't very useful):
 *
 *   const list = [...["why"]];
 * @description Checks that in-place literals are enabled for sets
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const res1 = {...["why"]};
  Expect.setEquals({"why"}, res1);
  const res2 = {...?["not"]};
  Expect.setEquals({"not"}, res2);

  const res3 = {...{"why"}};
  Expect.setEquals({"why"}, res3);
  const res4 = {...?{"not"}};
  Expect.setEquals({"not"}, res4);

  const aList = [1, 2, 3];

  const res5 = {2, ...[1, 3], 4, 15, ...[null], ...{12345}, aList};
  Expect.setEquals({2, 1, 3, 4, 15, null, 12345, aList}, res5);

  const res6 = {1, 2, 3, ...[4, 5, 6], ...?[7, 8, 9], aList};
  Expect.setEquals({1, 2, 3, 4, 5, 6, 7, 8, 9, aList}, res6);

  const aSet = {1, 2, 3};
  const res7 = {1, 2, 3, ...[4, 5, 6], ...?{7, 8, 9}, aSet};
  Expect.setEquals({1, 2, 3, 4, 5, 6, 7, 8, 9, aSet}, res7);
}
