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
 * @description Checks that compile error is not thrown when parametrized type
 * is used in the constant object expression with [is] constructions (see Issue
 * 37033 for more details)
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {
  const A();
}

const b1 = 1 is A;
const b2 = 1 is A<dynamic>;
const b3 = 1 is A<Object>;
const b4 = 1 is A<Null>;
const b5 = 1 is A<void>;

const b6 = 1 is A<A>;
const b7 = 1 is A<A<dynamic>>;
const b8 = 1 is A<A<Object>>;
const b9 = 1 is A<A<Null>>;
const b10 = 1 is A<A<void>>;

main() {
}
