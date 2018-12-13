/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E last
 * Returns the last element.
 * Throws a StateError if this is empty. Otherwise may iterate through the
 * elements and returns the last one seen. Some iterables may have more
 * efficient ways to find the last element (for example a list can directly
 * access the last element, without iterating through the previous ones).
 * @description Checks that the last element of the list is returned.
 * @author kaigorodov
 */
library last_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {

  check(Iterable source) {
    if (isSet) {
      //  for Sets, we can only check that returned element belongs to the set
      Expect.isTrue(source.contains(create(source).last));
    } else {
      Expect.equals(source.last, create(source).last);
    }
  }

  List a = new List();
  a.add(0);
  check(a);

  a.add(1);
  check(a);

  a.add(1);
  check(a);

  List b = new List(1000);
  b[999] = 999;
  a.addAll(b);
  check(b);

  a.length = 2001;
  a[2000] = 2001;
  check(a);

  a = new List(10);
  a[9] = 9;
  check(a);

  a = [null, 0, 0, false, -1];
  check(a);

  a = const [null, 0, 0, false, 100];
  check(a);
}
