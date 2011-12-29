/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the list satisfy the predicate [f].
 * @description Checks various correct list and predicate combinations.
 * @author vasya
 * @reviewer iefremov
 */

main() {
  Expect.isTrue([0,1,2,3].some( bool f(int e) { return (e > 1 && e < 3); } ));
  Expect.isFalse([1,2,3].some( bool f(int e) { return (e < 0); } ));
  Expect.isTrue([null].some( bool f(Object e) { return true; } ));
  Expect.isFalse([null].some( bool f(Object e) { return false; } ));

  Expect.isTrue([null,1,"string",[], [null]].some( bool f(Object e) { return (e is String); } ));

  List<int> a = new List(4567);
  a[4566] = 0;
  Expect.isTrue(a.some( bool f(int e) { return (e == 0); } ));

  a = ["", "1", [], [null]];
  bool f(Object e) { return e is List; }
  Expect.isTrue(a.some(f));
  List b = new List.from(a);
  Expect.isTrue(b.some(f));

  bool f1 (int e) { return (e > 1); }
  a = [1,2,3,4];
  Expect.isTrue(a.some(f1));
  a.setRange(1, 3, [-2,-3,-4]);
  Expect.isFalse(a.some(f1));
}
