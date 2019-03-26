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
 * @description Checks that if [a] and [b] are set literals, their spread is set.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

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
  var set2 = <int>{14, 18, 99};
  var list1 = [10, 12, 15, 16, 20];
  var list2 = <String>["test"];
  var b = <bool>[];
  Iterable i = new MyIterable();

  Set res1 = {...set1, ...set2};
  Set res2 = {...set2, ...list1};
  Set res3 = {...set1, ...list2};
  Set res4 = {...list1, ...i};
  Set res5 = {...i, ...b};
  Set res6 = {...set2, ...list1, ...list2, ...b, ...i};
}
