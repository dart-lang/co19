/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Variables can be assigned the result of expressions whose type is assignable to the type of the variable.
 * Otherwise, a type warning must be produced during static analysis.
 * @description Class B is assignable to class A
 * @author msyabro
 * @reviewer akuznecov
 */

class A {
  A() {}
}

class B extends A{
  B(): super() {}
}


main() {
  A a;
  B b = new B();
  a = b;
}
