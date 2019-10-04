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
 * @description Checks that compile error is thrown if constant constructor
 * argument is not a constant itself.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

dynamic nonConst1 = 11;
int nonConst2 = 0;
dynamic nonConst3;

class MyClass {
  final bool b;
  const MyClass(Object o) : b = false && ((o as int) > 25);
}

main() {
  const MyClass c1 = MyClass(nonConst1);
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass c2 = MyClass(nonConst2);
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass c3 = MyClass(nonConst3);
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
