/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the function type of an overriding function is not assignable to 
 * the function type of all overridden functions, a warning must be issued during static type check.
 * @description Parameter of the overriden function is not assignable to parameter of a function
 * @author msyabro
 * @static-type-error
 * @reviewer pagolubev
 */

interface I1 {}
interface I2 {}

class C1 {
  C1() {}
  foo(I1 i) {}
}

class C2 extends C1 {
  C2() : super() {}
  foo(I2 i) {}
}


void main() {
  C1 c = new C2();
}
