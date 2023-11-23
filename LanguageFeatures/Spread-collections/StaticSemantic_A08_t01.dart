// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Note that you can spread any [Iterable] into a set literal, not
/// just other sets
/// @description Checks that list and custom [Iterable] cannot be assigned to
/// set, but can be spreaded into a set literal.
/// @author iarkh@unipro.ru

import "dart:collection";

class MyIterable extends IterableBase {
  MyIterable();
  Iterator get iterator => MyIterator();
}

class MyIterator implements Iterator {
  int i = -1;

  MyIterator() {}

  @override
  bool moveNext() => ++i < 10;

  @override
  dynamic get current => i;
}

main() {
  Set set = {1, 2, 3};
  List list = [null, 14, "testme"];
  Iterable i = new MyIterable();

  Set s1 = {...set};
  Set s2 = {...list};
  Set s3 = {...i};

  var set1 = {1, 2, 3} as Set?;
  var list1 = [null, 14, "testme"] as List?;
  var i1 = new MyIterable() as Iterable?;

  Set s4 = {...?set1};
  Set s5 = {...?list1};
  Set s6 = {...?i1};
}
