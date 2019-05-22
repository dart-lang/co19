/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a parameterized type [T] is
 * super-bounded when it is used in any of the following ways:
 *   [T] is an immediate subterm of a new expression (16.15.1) or a constant
 *   object expression
 * @description Checks that compile error is thrown when parametrized type is
 * used in [new] expression.
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

main() {
  A a1 = new A<dynamic>();    //# 01: compile-time error
  A a2 = new A<Object>();     //# 02: compile-time error
  A a3 = new A<void>();       //# 03: compile-time error
  A a4 = new A<Null>();

  A a5 = new A<A<dynamic>>(); //# 04: compile-time error
  A a6 = new A<A<Object>>();  //# 05: compile-time error
  A a7 = new A<A<void>>();    //# 06: compile-time error
  A a8 = new A<A<Null>>();
}
