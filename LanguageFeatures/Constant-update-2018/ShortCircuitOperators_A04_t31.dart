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
 * throws a compile error if condition is of incorrect type.
 * @author iarkh@unipro.ru
 */

const s = "wrong condition";
const dynamic b = true;
const dynamic d = "wrong dynamic";
const dynamic nil = null;

class MyClass {
  final String res;
  const MyClass(dynamic cond) : res = cond ? "yes" : "no";
}


main() {
  const res1 = MyClass(s);
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res2 = MyClass(b);

  const res3 = MyClass(d);
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res4 = MyClass(null);
//             ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res5 = MyClass(nil);
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res6 = MyClass(10);
//             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
