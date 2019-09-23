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
 * throws a compile error if condition is [true] and the first operand is not a
 * correct constant expression.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018

class MyClass1 {
  final String res;
  const MyClass1() : res = (true ? (null as String).length : "false");
}

class MyClass2 {
  final String res;
  const MyClass2(String str) : res = (true ? str : "false");
}


main() {
  const res1 = true ? (null as String).length : "String here";
//                    ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass1  res2 = MyClass1();
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass2 res3 = MyClass2((null as String).length);
//                               ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
