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
 * @reviewer msyabro
 */

class A {
  A(this.x) {}
  bool operator==(A other) { return x == other.x; }
  int get hashCode { return x; }
  int x;
}


main() {
  Set<A> s = new Set<A>();
  s.addAll([new A(1), new A(-1)]);

  s.forEach((A a) {
    a.x *= 2;
  });

  Expect.isTrue(s.length == 2);
  Expect.isFalse(s.contains(new A(1)));
  Expect.isFalse(s.contains(new A(-1)));
}
