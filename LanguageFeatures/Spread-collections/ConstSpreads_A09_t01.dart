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

const l1 = [];
const l2 = [1, 2, 3];
const Set s1 = {};
const s2 = {11};

main() {
  const List res1 = const [...l1];
  Expect.listEquals(l1, res1);

  const List res2 = const [...l2];
  Expect.listEquals(l2, res2);

  const List res3 = const [...s1];
  Expect.listEquals([], res3);

  const List res4 = const [...l2];
  Expect.listEquals(l2, res4);

  const List res5 = [...l1, ...l2, ...s1, ...s2];
  Expect.listEquals([1, 2, 3, 11], res5);
}
