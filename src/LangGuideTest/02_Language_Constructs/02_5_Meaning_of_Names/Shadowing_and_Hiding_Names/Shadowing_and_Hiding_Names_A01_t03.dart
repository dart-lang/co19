/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Shadowing and hiding is not allowed except that a final formal parameter of a method,
 * constructor, or setter may shadow a field or accessor.
 * @description Checks that final method parameters can shadow a field.
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var x;
  
  foo(final x) {
    Expect.isTrue(x == -3);
  }

  A() : x = 0 {}
}


void main() {
  A a = new A();
  a.foo(-3);
}
