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
 * parametrized type is used in the constant object expression with [is]
 * constructions.
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

main() {
  bool b1 = 1 is A;

  bool b2 = 1 is A<dynamic>;
  bool b3 = 1 is A<Object>;
  bool b4 = 1 is A<Null>;
  bool b5 = 1 is A<void>;

  bool b6 = 1 is A<A>;
  bool b7 = 1 is A<A<dynamic>>;
  bool b8 = 1 is A<A<Object>>;
  bool b9 = 1 is A<A<Null>>;
  bool b10 = 1 is A<A<void>>;
}
