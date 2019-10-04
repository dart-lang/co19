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
 * @description Checks that conditional operator [?]/[:] throws a error if
 * operand is not constant in the constant constructor
 * @author iarkh@unipro.ru
 */

int i = 0;
dynamic d;

class MyClass1 {
  final int res;
  const MyClass1() : res = (true ? true : i);
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class MyClass2 {
  final int res;
  const MyClass2() : res = (true ? i : false);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

class MyClass3 {
  final int res;
  const MyClass3() : res = (false ? true : d);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

class MyClass4 {
  final int res;
  const MyClass4() : res = (true ? d : false);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
