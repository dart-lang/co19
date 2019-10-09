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
 * throws a compile error if condition is incorrect.
 * @author iarkh@unipro.ru
 */

class MyClass1 {
  final int res;
  const MyClass1() : res = ((null as String).length > 0) ? 0 : 5;
}

class MyClass2 {
  final int res;
  const MyClass2(cond) : res = (cond as bool) ? 0 : 5;
}

main() {
  const res = ((null as String).length > 0) ? 1 : 2;
//             ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res1 = MyClass1();
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res2 = MyClass2((null as String).length > 0);
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
