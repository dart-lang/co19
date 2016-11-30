/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool moveNext()
 * Returns whether the [Iterator] has elements left.
 * @description Checks that true is returned only if the [Iterator] has elements
 * left.
 * @author kaigorodov
 */
library moveNext_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterator create([Iterable content]), {bool isSet: false}) {

  void check(Iterator it, bool expected) {
    Expect.equals(expected, it.moveNext());
  }

  check(create([]), false);

  List a = new List();
  check(create(a), false);
  a.add(0);
  check(create(a), true);

  a = new List();
  a.length = 2547;
  check(create(a), true);

  a.clear();
  check(create(a), false);

  a.length = 1;
  check(create(a), true);

  check(create(const[]), false);

  check(create(const[1]), true);
}
