/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For spreading into map literals, we require the spread object to
 * be a class that implements [Map], but not necessarily a subtype of the map
 * being spread into.
 * @description Checks that [Map] object can be spread into the spreadable map.
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
    if (i < 5) {
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
  LinkedHashMap aMap = Map.fromIterables(new MyIterable(), new MyIterable());
  Map map = {...aMap};
  Expect.mapEquals({1: 1, 2: 2, 3: 3, 4: 4, 5: 5}, map);
}
