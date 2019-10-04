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
 * @description: Checks that constant set spread element can be constant list or
 * set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const l1 = [];
const l2 = [1, 2, 3];

const Set s1 = {};
const s2 = {4, 5, 6};

main() {
  const Set res1 = const {...l1};
  Expect.setEquals(s1, res1);

  const Set res2 = const {...l2};
  Expect.setEquals({1, 2, 3}, res2);

  const Set res3 = const {...s1};
  Expect.setEquals(s1, res3);

  const Set res4 = const {...s2};
  Expect.setEquals(s2, res4);

  const Set res5 = const {...l1, ...l2, ...s1, ...s2};
  Expect.setEquals({1, 2, 3, 4, 5, 6}, res5);
}
