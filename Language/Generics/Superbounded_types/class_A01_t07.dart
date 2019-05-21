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
 * @description Checks that compile error is thrown when not well-bounded
 * parametrized type is used in the constant object expression with [as]
 * constructions.
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

main() {
  var b1 = null as A<int>;    //# 01: compile-time error
  var b2 = null as A<A<int>>; //# 02: compile-time error
}
