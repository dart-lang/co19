/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potentially constant
 * expression.
 * @description Checks that conditional operator [?]/[:] in constant expression
 * throws a compile error if some operand is of incorrect type.
 * @author iarkh@unipro.ru
 */

class MyClass1 {
  final int res;
  const MyClass1(dynamic checkme, dynamic x, dynamic y) :
        res = (checkme ? x : y);
}

main() {
  const c1 = MyClass1(true, 1, "");

  const c2 = MyClass1(true, "", 2);
//           ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c3 = MyClass1(false, 2, "test is here");
//           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c4 = MyClass1(false, "It's correct", 12345);

}
