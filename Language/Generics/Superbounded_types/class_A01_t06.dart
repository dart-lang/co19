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
 * @description Checks that compile error is not thrown when well-bounded
 * parametrized type is used in the constant object expression with [as]
 * constructions.
 * @Issue 37028
 * @author iarkh@unipro.ru
 */
class A<T extends A<T>> {}

main() {
  var b1 = null as A;

  var b2 = null as A<dynamic>;
  var b3 = null as A<Object>;
  var b4 = null as A<Null>;
  var b5 = null as A<void>;

  var b6 = null as A<A>;
  var b7 = null as A<A<dynamic>>;
  var b8 = null as A<A<Object>>;
  var b9 = null as A<A<Null>>;
  var b10 = null as A<A<void>>;
}
