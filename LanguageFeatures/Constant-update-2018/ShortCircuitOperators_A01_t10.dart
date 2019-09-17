/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [&&] operator is now short-circuit in constant and potentially
 * constant expressions. It only attempts to evaluate the second operand if the
 * first operand evaluates to [true]. This makes [false && (null as
 * String).length] a valid constant expression. The second operand expression
 * still needs to be a potentially constant expression, which is a new use of
 * potentially constant expressions outside of [const] constructor initializer
 * lists.
 * @description Checks that compile error is thrown if the first operand in the
 * constant [&&] expression is [false] and the second one is not a constant
 * expression.
 * @author iarkh@unipro.ru
 */

dynamic nonConst;
const int i = 5;
bool bb = true;

class MyClass1 {
  final bool b;
  const MyClass1() : b = false && nonConst;
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  const bool a1 = (i < 0) && nonConst;
//                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a2 = false && bb;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a3 = false && i < nonConst;
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
