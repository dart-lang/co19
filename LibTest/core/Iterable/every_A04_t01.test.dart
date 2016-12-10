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
 * @description Checks that predicate exception goes through to the caller
 * @author varlax
 */
library every_A04_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {

  check(List a0, bool predicate(var e), exc) {
    Iterable a = create(a0);
    int actualCount = 0;
    Expect.throws(
      () {
        a.every((var e) {
          actualCount++;
          return predicate(e);
        });
      },
      (e) {return identical(exc, e);}
    );
    Expect.equals(1, actualCount);
  }

  bool allTrue(var e) {
    throw 1;
  }
  check([1, 2, 3, 4, 5], allTrue, 1);
  
  bool allFalse(var e) {
    throw false;
  }
  check([1, 2, 3, 4, 5], allFalse, false);
  
  bool lessThan3(var e) {
    throw 3;
  }
  check([1, 2, 3, 4, 5], lessThan3, 3);
  check(const [1, 2, 3, 4, 5], lessThan3, 3);
  check(new List.from([1, 2, 3, 4, 5]), lessThan3, 3);
  List l = new List();
  l.addAll([1, 2, 3, 4, 5]);
  check(l, lessThan3, 3);
}
