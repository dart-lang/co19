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
 * @description: Checks that constant set spread element can be constant list
 * or set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

Set emptyset = {};

main() {
  const Set res1 = const {...[1, 2, 3], 4};
  Expect.setEquals({1, 2, 3, 4}, res1);

  const Set res2 = const {5, ...{2, 11}};
  Expect.setEquals({5, 2, 11}, res2);

  const Set res3 = const {...{}};
  Expect.setEquals(emptyset, res3);
}
