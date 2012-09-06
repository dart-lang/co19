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
 * @description Checks that a name of a function declaration is available in its body.
 * @author iefremov
 * @reviewer kaigorodov
 */

main() {
  var x;
  void g() {
    x = g;
  }
  g();
  Expect.isNotNull(x);
  Expect.isTrue(x is Function);

  var log = [];
  void f(counter) {
    log.add(counter);
    if(counter == 0) return;
    f(counter-1);
  }
  f(10);
  Expect.listEquals([10,9,8,7,6,5,4,3,2,1,0], log, "Local function recursion didn't worked!");

  var foo = Function zoo() => zoo;
  var bar = foo();
  Expect.isNotNull(bar);
  Expect.isTrue(bar is Function);
}
