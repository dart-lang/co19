/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that [||] throws a compile error if the first operand in
 * the constant expression [||] is [true] and the second one is not a constant.
 * @author iarkh@unipro.ru
 */

dynamic nonConst;
const int i = 5;
bool bb = true;

class MyClass {
  final bool b;
  const MyClass() : b = true || nonConst;
//                              ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  const bool a1 = (i > 0) || bb;
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a2 = true || nonConst;
//                        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const bool a3 = true || i < nonConst;
//                            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
