/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A spreadElement starting with [...] is a constant element if its expression
 * is constant and it evaluates to a constant List, Set or Map instance
 * originally created by a list, set or map literal. It is a potentially
 * constant element if the expression is a potentially constant expression.
 * @description: Checks some disambiguilty cases for sets and maps.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const l1 = [];
const s1 = {11};
const m1 = {1: 1};
const int i1 = 25;
const n = null;

Set emptyset = {};

main() {
  const res1 = {...l1};
  Expect.setEquals(emptyset, res1);

  const res2 = {1, ...l1, 2};
  Expect.setEquals({1, 2}, res2);

  const res3 = {...s1};
  Expect.setEquals({11}, res3);

  const res4 = {1, ...s1, 2};
  Expect.setEquals({1, 11, 2}, res4);

  const res5 = {...m1};
  Expect.mapEquals(m1, res5);

  const res6 = {7: 1, ...m1, 3: 14};
  Expect.mapEquals({7: 1, 1: 1, 3: 14}, res6);
}
