/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the list satisfy the predicate [f].
 * @description Checks that method is called for each element until the first true result
 * @author vasya
 * @author msyabro
 */

 //Checks that [some] calls [predicate] a [count] number of times
check(List a, bool predicate(var e), int count) {
  int actualCount = 0;
  a.some(void f(var e) {
    actualCount++;
    return predicate(e);
  });
  Expect.equals(count, actualCount);
}

main() {
  bool allTrue(var e) {
    return true;
  }
  check([1, 2, 3, 4, 5], allTrue, 1);
  
  bool allFalse(var e) {
    return false;
  }
  check([1, 2, 3, 4, 5], allFalse, 5);
  
  bool greaterThan3(var e) {
    return e > 3;
  }
  check([1, 2, 3, 4, 5], greaterThan3, 4);
}
