/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in
 * the set.
 * @description Checks that elements with the same hash code that are not equal
 * according to == operator do not replace each other when added to the set but
 * those that are equal replace each other.
 * @author pagolubev
 */
library add_A01_t03;
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

  int numValues = 19;
  for(int i = 0; i < numValues; i++) {
    s.add(new A(i));
    int expectedSize = i + 1;
    Expect.isTrue(s.contains(new A(i)));
    Expect.isTrue(s.length == expectedSize);

    s.add(new A(i));
    Expect.isTrue(s.length == expectedSize);
    Expect.isTrue(s.contains(new A(i)));
  }
}

main() {
  test(create);
}
