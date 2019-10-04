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
 * @description: Checks that constant map spread element can be constant map
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

const Map m1 = {1: 1};
const Map m2 = {2: 14, 3: 29};
const Map m3 = {};


main() {
  const Map res1 = const {...m1};
  Expect.mapEquals(m1, res1);

  const Map res2 = const {...m2};
  Expect.mapEquals(m2, res2);

  const Map res3 = const {...m3};
  Expect.mapEquals(m3, res3);

  const Map res4 = const {...m1, ...m2, ...m3};
  Expect.mapEquals({1: 1, 2: 14, 3: 29}, res4);
}
