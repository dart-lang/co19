/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the array satisfy the predicate [f]. 
 * @description Checks various arrays and predicates.
 * @author vasya
 * @reviewer iefremov
 * @needsreview add modification tests
 */


main() {
  Expect.isTrue([0,1,2,3].some( bool f(int e) { return (e > 1 && e < 3); } ));
  Expect.isTrue(![1,2,3].some( bool f(int e) { return (e < 0); } ));
  Expect.isTrue([null].some( bool f(Object e) { return true; } ));
  Expect.isTrue(![null].some( bool f(Object e) { return false; } ));

  Expect.isTrue([null,1,"string",[], [null]].some( bool f(Object e) { return (e is String); } ));

  Array<int> a = new Array(4567);
  a[4566] = 0;
  Expect.isTrue(a.some( bool f(int e) { return (e == 0); } ));

  a = ["", "1", [], [null]];
  bool f(Object e) { return e.isEmpty(); }
  Expect.isTrue(a.some(f));
  Array b = a.toArray();
  Expect.isTrue(b.some(f));

  bool f1 (int e) { return (e > 1); }
  a = [1,2,3,4];
  Expect.isTrue(a.some(f1));
  a.copyFrom([-2,-3,-4], 0, 1, 3);
  Expect.isTrue(!a.some(f1));
}
