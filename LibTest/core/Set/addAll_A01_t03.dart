/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void addAll(Iterable<E> elements)
 * Adds all of elements to this Set.
 * @description Checks that hash code collisions do not prevent addition of
 * different objects (not equal with regards to == operator) to the set.
 * @author pagolubev
 */
library addAll_A01_t03;
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
  List<A> a = [new A(7), new A(2), new A(-8), new A(2), new A(2)];
  s.addAll(a);
  Expect.isTrue(s.length == 3);
  Expect.isTrue(s.contains(new A(7)));
  Expect.isTrue(s.contains(new A(2)));
  Expect.isTrue(s.contains(new A(-8)));
}

main() {
  test(create);
}
