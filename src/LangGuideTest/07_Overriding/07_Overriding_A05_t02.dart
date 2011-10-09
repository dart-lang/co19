/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the function type of an overriding function is not assignable to 
 * the function type of all overridden functions, a warning must be issued during static type check.
 * @description Parameter of the overriden function is assignable to parameter of a function
 * @author msyabro
 * @reviewer pagolubev
 */


interface I1 {}
interface I2 extends I1 {}

class C1 {
  foo(I1 i) {}
}
class C2 extends C1 {
  foo(I2 i) {}
}


void main() {}
