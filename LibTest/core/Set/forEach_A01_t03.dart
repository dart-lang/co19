/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Passes a function that modifies the set as argument to forEach().
 * @author pagolubev
 * @needsreview Set behaviour when elements are modified while iterating
 * with forEach() is not specified. Currently element modification does
 * not change its position in the hash table.
 */
library forEach_A01_t03;
import "set.lib.dart";
import "../../../Utils/expect.dart";

class A implements Comparable {
  int x;

  A(this.x);
  bool operator ==(dynamic other) => x == other.x;
  int get hashCode => -1;
  // to allow run this test for ordered sets we need A to be comparable
  int compareTo(dynamic other) => this.x - other.x;
}

test(Set create([Set content])) {
  Set s = create();
  s.addAll([new A(1), new A(-1)]);

  s.forEach((var a) {
    a.x *= 2;
  });

  Expect.isTrue(s.length == 2);
  Expect.isFalse(s.contains(new A(1)));
  Expect.isFalse(s.contains(new A(-1)));
}

main() {
  test(create);
}
