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

class MyClass1 {
  final res;
  const MyClass1() : res = s ? "yes" : "no";
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class MyClass2 {
  final res;
  const MyClass2() : res = b ? "yes" : "no";
}

class MyClass3 {
  final res;
  const MyClass3() : res = d ? "yes" : "no";
}

class MyClass4 {
  final res;
  const MyClass4() : res = null ? "yes" : "no";
}

class MyClass5 {
  final res;
  const MyClass5() : res = nil ? "yes" : "no";
}

class MyClass6 {
  final res;
  const MyClass6() : res = 10 ? "yes" : "no";
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {

  const res2 = MyClass2();

  const res3 = MyClass3();
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res4 = MyClass4();
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res5 = MyClass5();
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
