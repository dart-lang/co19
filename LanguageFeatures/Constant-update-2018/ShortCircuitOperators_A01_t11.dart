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
 * @description Checks that [&&] throws error if the first operand of [&&]
 * operation is [true] and the second one is not valid or is not constant in the
 * constant expression.
 * @author iarkh@unipro.ru
 */

const dynamic i = 10;
bool b = true;
bool c;
dynamic d;

main() {
  const bool a1 = true && i;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a2 = true && b;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a3 = true && c;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a4 = true && d;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
