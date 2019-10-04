/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise the [||] operator only evaluates its second operand if
 * the first evaluates to [false], and the second operand must be a potentially
 * constant expression.
 * @description Checks that compile error is thrown if constant constructor
 * argument is not a constant itself.
 * @author iarkh@unipro.ru
 */

int i = 0;
dynamic str;
dynamic a = 1;

class MyClass {
  final bool b;
  const MyClass(Object o) : b = true || ((o as int) > 25);
}

main() {
  const MyClass c1 = MyClass(i);
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass c2 = MyClass(str);
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass c3 = MyClass(a);
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

}
