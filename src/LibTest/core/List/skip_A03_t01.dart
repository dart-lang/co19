/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> skip(int n)
 * Throws RangeError if n is negative.
 * @needsreview undocumented
 * @description checks that a RangeError is thrown if n is negative.
 * @issue 10894 
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(List a, int n) {
 Iterable res;
 try {
    res=a.skip(n);
//    Expect.fail("RangeError expected when calling a.skip");
  } on RangeError catch(ok) {}
  
//  for (var el in a.skip(n)) {
  Iterator it=res.iterator;
  while (it.moveNext()) {
    Expect.fail("iterating through empty Iterable gives "+it.current);
  }      
}

main() {
[1,2,-3,4].skip(-1);
  check([1,2,-3,4], -1);
  check(const[1,2,-5,-6, 100], -1);
  check(const[null,2,-5,-6, 100], -1000);
}