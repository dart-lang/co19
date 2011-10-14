/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Class may extend another class (single inheritance).
 * @description Some simple checks against inheritance.
 * @author iefremov
 * @reviewer msyabro
 */

class B {
  B() {}
  var b;
}

class A extends B {
  A() : super() {}
}


main() {
  A a = new A();
  a.b = 1;
  Expect.isTrue(a.b == 1);     
}
