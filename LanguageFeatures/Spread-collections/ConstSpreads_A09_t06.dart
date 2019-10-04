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
 * @description: Checks that constant list spread element can be constant list
 * or set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  const List res1 = const [...[1, 2, 3], 4];
  Expect.listEquals([1, 2, 3, 4], res1);

  const List res2 = const [5, ...{2, 11}];
  Expect.listEquals([5, 2, 11], res2);

  const List res3 = const [...[]];
  Expect.listEquals([], res3);
}
