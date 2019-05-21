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
 * used in the constant object expression with [is] constructions.
 * @Issue 37033
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018

class A<T extends A<T>> {
  const A();
}

const b1 = 1 is A;
const b2 = 1 is A<dynamic>; //# 01: compile-time error
const b3 = 1 is A<Object>;  //# 02: compile-time error
const b4 = 1 is A<Null>;
const b5 = 1 is A<void>;    //# 03: compile-time error

const b6 = 1 is A<A>;
const b7 = 1 is A<A<dynamic>>; //# 04: compile-time error
const b8 = 1 is A<A<Object>>;  //# 05: compile-time error
const b9 = 1 is A<A<Null>>;
const b10 = 1 is A<A<void>>;   //# 06: compile-time error

main() {
}
