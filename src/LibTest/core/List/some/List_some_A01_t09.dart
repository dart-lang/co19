/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the list satisfy the predicate [f].
 * @description Checks that [f] is not called if the list is empty
 * @author msyabro
 * @needsreview
 */

 //Checks that [some] does not call [predicate]
check(List a, bool predicate(var e)) {
  int actualCount = 0;
  a.some(void f(var e) {
    actualCount++;
    return predicate(e);
  });
  Expect.equals(0, actualCount);
}

main() {
  bool allTrue(var e) {
    return true;
  }
  check([], allTrue);
  
  bool allFalse(var e) {
    return false;
  }
  check([], allFalse);
  
  bool lessThan3(var e) {
    return e < 3;
  }
  check([], lessThan3);
}