/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generative constructor may be redirecting, in which case its
 * only action is to invoke another generative constructor. A redirecting
 * constructor has no body; instead, it has a redirect clause that specifies
 * which constructor the invocation is redirected to, and with what arguments.
 * redirection:
 *   ':' this ('.' identifier)? arguments
 * ;
 * @description Checks that cyclic dependency in constructor redirection
 * produces a compile error (Using a longer redirection chain).
 * @compile-error
 * @author iefremov
 */

class C {
  C.c0() : this.c9();
  C.c1() : this.c0();
  C.c2() : this.c1();
  C.c3() : this.c2();
  C.c4() : this.c3();
  C.c5() : this.c4();
  C.c6() : this.c5();
  C.c7() : this.c6();
  C.c8() : this.c7();
  C.c9() : this.c8();

}

main() {
  try {
    var x = new C.c0();
  } catch (x) {}
}
