/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Note that you can spread any [Iterable] into a set literal, not
 * just other sets
 * @description Checks that list and custom [Iterable] cannot be assigned to
 * set, but can be spreaded into a set literal.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "dart:collection";

class MyIterable extends IterableBase {
  MyIterator iterator;

  MyIterable() { iterator = new MyIterator(); }

  Iterator getIterator() { return iterator; }
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
  Set set = {1, 2, 3};
  List list = [null, 14, "testme"];
  Iterable i = new MyIterable();

  Set set1 = {...set};
  Set set2 = {...list};
  Set set3 = {...i};
}
