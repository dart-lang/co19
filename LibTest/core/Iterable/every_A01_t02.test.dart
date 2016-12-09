/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @description Checks that the predicate method is called for each element
 * until the first false result.
 * @author vasya
 * @author msyabro
 */
library every_A01_t02;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {

  //Checks that [every] calls [predicate] a [count] number of times
  check(List a0, bool predicate(var e), int count) {
    Iterable a = create(a0);
    int actualCount = 0;
    a.every((var e) {
      actualCount++;
      return predicate(e);
    });
    Expect.equals(count, actualCount);
  }

  bool allTrue(var e) {
    return true;
  }
  check([1, 2, 3, 4, 5], allTrue, 5);
  
  bool allFalse(var e) {
    return false;
  }
  check([1, 2, 3, 4, 5], allFalse, 1);
  
  bool lessThan3(var e) {
    return e < 3;
  }
  check([1, 2, 3, 4, 5], lessThan3, 3);
  check(const [1, 2, 3, 4, 5], lessThan3, 3);
  check(new List.from([1, 2, 3, 4, 5]), lessThan3, 3);
  List l = new List();
  l.addAll([1, 2, 3, 4, 5]);
  check(l, lessThan3, 3);
}
