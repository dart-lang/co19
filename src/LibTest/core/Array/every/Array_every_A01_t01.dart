/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every element of the array satisfy the predicate [f]. Returns false otherwise.
 * @description Trivial check.
 * @author vasya
 * @reviewer iefremov
 * @needsreview Are we working with the copy of array? Add test for array modification.
 */


main() {
  Array a = [0,1,2,3,4,5,6,7,8,9];
  Expect.isTrue(a.every( bool f(int e) { return (e >= 0 && e < 10); } ));
  Expect.isTrue(!a.every( bool f(int e) { return (e < 0); } ));

  a = [[],[null], [1,2,3,4], ["string"]];
  Expect.isTrue(a.every( bool f(Collection e) { return (e is Array); } ));
  Expect.isTrue(!a.every( bool f(Collection e) { return (e is Set); } ));

  a = new Array<String>(0);
  Expect.isTrue(a.every( bool f(String e) { return (e.isEmpty()); } ));

  a = new Array<int>(96547);
  Expect.isTrue(a.every( bool f(int e) { return (e == null); } ));

  a = [1,2,3];
  bool f (int e) { return (e > 0); }
  Expect.isTrue(a.every(f));
  Array b = a.toArray();
  Expect.isTrue(a.length == b.length && b.every(f));

  a.copyFrom([-1,-2,-3],0,0,3);
  Expect.isTrue(!a.every(f));
}
