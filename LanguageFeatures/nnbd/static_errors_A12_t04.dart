/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a named parameter that is part of a required
 * group is not bound to an argument at a call site
 *
 * @description Check that it is an error if a named parameter that is part of a
 * required group is not bound to an argument at a call site. Test legacy
 * pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

class C {
  static void test1({required A x, String y = "", required A z}) {}
  void test2({required A x, String y = "", required A z}) {}

  static void test11({required A? x, String y = "", required A? z}) {}
  void test22({required A? x, String y = "", required A? z}) {}
}

void test3({required A x, String y = "", required A z}) {}
void test33({required A? x, String y = "", required A? z}) {}

typedef void Foo({required A x, String y, required A z});
typedef void Foo2({required A? x, String y, required A? z});

main() {
  A a = new A();
  Foo foo = ({required A x, String y = "", required A z}) {};
  Foo2 foo2 = ({required A? x, String y = "", required A? z}) {};

  C.test1(x: a, y: "");
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  C.test11(x: a, y: "");
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  C().test2(x: a, y: "");
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  C().test22(x: a, y: "");
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  test3(x: a, y: "");
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  test33(x: a, y: "");
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  foo(x: a, y: "");
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  foo2(x: a, y: "");
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  C.test1(z: a, y: "woman");
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

  C.test11(z: a, y: "cry");
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  C().test2(z: a, y: "woman");
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  C().test22(z: null, y: "cry");
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

  test3(z: a, y: "woman");
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  test33(z: null, y: "cry");
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  foo(z: a, y: "woman");
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

  foo(z: a, y: "cry");
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}
