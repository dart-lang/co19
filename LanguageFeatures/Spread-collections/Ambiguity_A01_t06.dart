/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression like:
 *
 *    { ...a, ...b }
 *    Is syntactically parsed as [mapOrSetLiteral]. To determine whether it
 *    actually is a map or set, the surrounding context is used. Given an
 *    [mapOrSetLiteral] with context type [C]:
 *
 *   If [Set<Null>] is assignable to [C], and [Map<Null, Null>] is not
 *   assignable to [C], then the collection is a set literal.
 *
 *   Otherwise, it is a map literal.
 *
 *   In other words, if it can only be a set, it is. Otherwise, it's a map.
 * @description Checks that if [a] is a map literal and [b] is set literals,
 * it's acceptable in some null-aware expressions.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  List list1 =  [1, 12, 24];
  List list2 = null;
  Map map1 = {1: 1, "test": 1, 14: null};
  Map map2 = null;

  Set res1 = {...1ist1, ...?map2};
  Set res2 = {...?map2, ...list1};
  Map res3 = {...?list2, ...map1};
  Map res4 = {...map1, ...?list2};
}
