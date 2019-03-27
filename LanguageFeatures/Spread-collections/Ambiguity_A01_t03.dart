/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression like:
 *   { ...a, ...b }
 * Is syntactically parsed as [mapOrSetLiteral]. To determine whether it
 * actually is a map or set, the surrounding context is used. Given an
 * [mapOrSetLiteral] with context type [C]:
 *
 * If [Set<Null>] is assignable to [C], and [Map<Null, Null>] is not
 * assignable to [C], then the collection is a set literal.
 *
 * Otherwise, it is a map literal.
 *
 * In other words, if it can only be a set, it is. Otherwise, it's a map.
 * @description Checks that if [a] and [b] are set literals (probably,
 * null-aware), their spread is a set.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

import "dart:collection";

class MyIterable extends IterableBase {

  MyIterable();

  Iterator get iterator => MyIterator();
}

class MyIterator extends Iterator {
  int i = -1;

  MyIterator() {}

  @override
  bool moveNext() { return ++i < 10; }

  @override
  dynamic get current { return i; }
}

main() {
  var set1 = {1, 2, 3};
  var list1 = [0, 2, 4, 6, 8];
  var map = null;
  List list2 = null;
  Iterable i = new MyIterable();

  Set res1 = {...set1, ...?list2};
  Set res2 = {...?list2, ...list1};
  Set res3 = {...?map, ...list1};
  Set res4 = {...?list2, ...?i};
  Set res5 = {...i, ...?map};
  Set res6 = {...set1, ...list1, ...?list2, ...?map, ...i};
  Set res7 = {...?set1, ...?list1, ...?list2, ...?map, ...?i};
}
