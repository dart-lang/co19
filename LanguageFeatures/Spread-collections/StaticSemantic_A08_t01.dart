/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Note that you can spread any [Iterable] into a set literal, not
 * just other sets
 * @description Checks the any [Iterable] can spread into a set literal.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "dart:collection";
import "../../Utils/expect.dart";

class MyIterable extends IterableBase {
  MyIterator iterator;

  MyIterable() {
    iterator = new MyIterator();
  }

  Iterator getIterator() {
    return iterator;
  }
}

class MyIterator extends Iterator<int> {
  int i = 0;

  @override
  bool moveNext() {
    if (i < 10) {
      i++;
      return true;
    } else {
      return false;
    }
  }

  @override
  int get current {
    return i;
  }
}

main() {
  Set set = [1, 2, 3].toSet();
  List list = [null, 14, "testme"];
  Iterable i = new MyIterable();


  Expect.setEquals(set, {...set});
  Expect.setEquals(list.toSet(), {...list});
  Expect.setEquals(i.toSet(), {...i});
}
