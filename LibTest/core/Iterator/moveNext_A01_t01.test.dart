/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool moveNext()
 * Returns whether the [Iterator] has elements left.
 * @description Checks that true is returned only if the [Iterator] has elements left.
 * @author kaigorodov
 */
library moveNext_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {
  void check(List a, bool expected) {
    Iterator it = create(a).iterator;
    Expect.equals(expected, it.moveNext());
  }

  check([], false);

  List a = new List();
  check(a, false);
  a.add(0);
  check(a, true);

  a = new List();
  a.length = 2547;
  check(a, true);

  a.clear();
  check(a, false);

  a.length = 1;
  check(a, true);

  check(const[], false);

  check(const[1], true);
}
