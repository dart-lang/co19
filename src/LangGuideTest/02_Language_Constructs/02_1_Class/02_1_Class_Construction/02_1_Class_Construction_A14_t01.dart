/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In addition to the standard class constructor, classes can also 
 * have named constructors.
 * @description Checks some basic named constructors.
 * @author iefremov
 * @reviewer msyabro
 */

class A {
  A.c1(this.i) {}
  A.c2(this.s) {}

  int i;
  String s;
}


main() {
   var a = new A.c1(42);
   var b = new A.c2("42");
   Expect.isTrue(a.i == 42);
   Expect.isTrue(b.s == "42");
}
