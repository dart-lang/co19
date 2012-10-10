/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration of the form 
 * T0 id(T1 a1, ..., Tn an, [Tn+1 xn+1 = d1, ..., Tn+k xn+k = dk]){s}
 * is equivalent to a variable declaration of the form
 * final F id = (T1 a1 , . . . , Tn an , [Tn+1 xn+1 = d1 , . . . , Tn+k xn+k = dk]){s},
 * where F is the function type alias (14.3.1)
 * typedef T0 F (T1 a1, ..., Tn an, [Tn+1 xn+1, ..., Tn+k xn+k]).
 * @description Checks that a local function cannot be used before it is declared
 * (a runtime error is produced).
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 * @issue 5773
 */

main() {
  try {
    void f() {g();}
    void g() {}
    Expect.fail("NoSuchMethodError expected when calling undefined method.");
  } on NoSuchMethodError catch (ex) {}
}
