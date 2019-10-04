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
 * @description Checks that compile error is thrown if some operand is not a
 * potentially constant in the constant constructor call.
 * @author iarkh@unipro.ru
 */

class MyClass1 {
  final int res;
  const MyClass1(int val) : res = (true ? 125 : val);
}

class MyClass2 {
  final int res;
  const MyClass2(int val) : res = (true ? val: 11);
}

class MyClass3 {
  final int res;
  const MyClass3(int val) : res = (false ? 125 : val);
}

class MyClass4 {
  final int res;
  const MyClass4(int val) : res = (false ? val: 11);
}


main() {
  int i = 0;
  dynamic j;

  const MyClass1 c1 = MyClass1(i);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass1 c2 = MyClass1(j);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass2 c3 = MyClass2(i);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass2 c4 = MyClass2(j);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass3 c5 = MyClass3(i);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass3 c6 = MyClass3(j);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass4 c7 = MyClass4(i);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  const MyClass4 c8 = MyClass4(j);
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

}
