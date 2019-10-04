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
 * used with constructor in the constant object expression.
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {
  const A();
}

main() {
  const a1 = A<dynamic>();    //# 01: compile-time error
  const a2 = A<Object>();     //# 02: compile-time error
  const a3 = A<void>();       //# 03: compile-time error
  const a4 = A<Null>();

  const a5 = A<A<dynamic>>(); //# 04: compile-time error
  const a6 = A<A<Object>>();  //# 05: compile-time error
  const a7 = A<A<void>>();    //# 06: compile-time error
  const a8 = A<A<Null>>();
}
