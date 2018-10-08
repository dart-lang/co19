/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void forEach(void f(E element))
 * Any error in the function [f] breaks the cycle.
 * @description Checks that predicate exception goes through to the caller
 * @author varlax
 */
library forEach_A03_t01;
import "../../../Utils/expect.dart";

check(List a, predicate(var e), exc) {
  int actualCount = 0;
  Expect.throws(
    () {
      a.forEach((var e) {
        actualCount++;
        return predicate(e);
      });
    }, (e) {return identical(exc, e);}
  );
  Expect.equals(1, actualCount);
}

test(Iterable create([Iterable content])) {
  allTrue(var e) {
    throw true;
  }
  check(create([1, 2, 3, 4, 5]), allTrue, true);
  
  allFalse(var e) {
    throw false;
  }
  check(create([1, 2, 3, 4, 5]), allFalse, false);
  
  lessThan3(var e) {
    throw 3;
  }
  check(create([1, 2, 3, 4, 5]), lessThan3, 3);
  check(create(const [1, 2, 3, 4, 5]), lessThan3, 3);
}
