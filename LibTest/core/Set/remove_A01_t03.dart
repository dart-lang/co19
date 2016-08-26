/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(T value)
 * Removes [value] from the set. Returns true if [value] was in the set.
 * Returns false otherwise. The method has no effect if [value] value was not in
 * the set.
 * @description Checks that items with the same hash code are removed correctly
 * by this method.
 * @author pagolubev
 */
library remove_A01_t03;
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
  s.addAll([new A(-3), new A(0), new A(7)]);

  Expect.isTrue(s.remove(new A(0)));
  Expect.isTrue(s.length == 2);
  Expect.isTrue(s.containsAll([new A(-3), new A(7)]));
  Expect.isFalse(s.contains(new A(0)));

  Expect.isTrue(s.remove(new A(7)));
  Expect.isTrue(s.length == 1);
  Expect.isTrue(s.contains(new A(-3)));
  Expect.isFalse(s.contains(new A(7)));

  Expect.isTrue(s.remove(new A(-3)));
  Expect.isTrue(s.length == 0);
  Expect.isFalse(s.contains(new A(-3)));
}

main() {
  test(create);
}
