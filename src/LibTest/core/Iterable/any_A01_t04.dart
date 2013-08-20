/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks various correct list and predicate combinations.
 * @author vasya
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue([0,1,2,3].any((int e) { return (e > 1 && e < 3); } ));
  Expect.isFalse([1,2,3].any((int e) { return (e < 0); } ));
  Expect.isTrue([null].any((Object e) { return true; } ));
  Expect.isFalse([null].any((Object e) { return false; } ));

  Expect.isTrue([null,1,"string",[], [null]].any((Object e) { return (e is String); } ));

  List<int> a = new List(4567);
  a[4566] = 0;
  Expect.isTrue(a.any((int e) { return (e == 0); } ));

  a = ["", "1", [], [null]];
  bool f(Object e) { return e is List; }
  Expect.isTrue(a.any(f));
  List b = new List.from(a);
  Expect.isTrue(b.any(f));

  bool f1 (int e) { return (e > 1); }
  a = [1,2,3,4];
  Expect.isTrue(a.any(f1));
  a.setRange(1, 4, [-2,-3,-4]);
  Expect.isFalse(a.any(f1));

  //const []
  a = const ["", "1", const [], const [null]];
  Expect.isTrue(a.any(f));
  b = new List.from(a);
  Expect.isTrue(b.any(f));

  a = const [1,2,3,4];
  Expect.isTrue(a.any(f1));
  a = const [1, -2,-3,-4];
  Expect.isFalse(a.any(f1));

  //List.from
  a = new List.from(["", "1", [], [null]]);
  Expect.isTrue(a.any(f));
  b = new List.from(a);
  Expect.isTrue(b.any(f));

  a = new List.from([1,2,3,4]);
  Expect.isTrue(a.any(f1));
  a.setRange(1, 4, [-2,-3,-4]);
  Expect.isFalse(a.any(f1));
}
