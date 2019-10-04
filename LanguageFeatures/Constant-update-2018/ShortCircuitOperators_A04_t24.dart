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

const String s = "constant string";
const dynamic d = "another string";

class MyClass1 {
  final int res;
  const MyClass1() : res = (true ? s : 0);
}

class MyClass2 {
  final int res;
  const MyClass2() : res = (true ? d : 0);
}

class MyClass3 {
  final int res;
  const MyClass3() : res = (true ? 0 : s);
}

class MyClass4 {
  final int res;
  const MyClass4() : res = (true ? 0 : "bad str");
}

class MyClass5 {
  final int res;
  const MyClass5() : res = (true ? 15 : d);
}

main() {
  const c1 = MyClass1();
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = MyClass2();
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c3 = MyClass3();
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c4 = MyClass4();
//          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c5 = MyClass5();
}
