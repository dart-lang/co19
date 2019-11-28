/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a required named parameter has a default value.
 *
 * @description Check that it is an error if a required named parameter has a
 * default value. Test both covariant and required modifiers
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {
  const A();
}

const a = const A();

class C {
  void test1({required covariant A x = a}) {}
//                                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test2(int x, {required covariant A s = a}) {}
//                                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test3(int x, {required covariant A y = a, int z = 42}) {}
//                                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
