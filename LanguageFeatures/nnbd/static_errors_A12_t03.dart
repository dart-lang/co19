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
 * required group is not bound to an argument at a call site
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class C {
  static void test1({required int x, String y = "", required String z}) {}
  void test2({required int x, String y = "", required String z}) {}
}

void test3({required int x, String y = "", required String z}) {}

typedef void Foo({required int x, String y, required String z});

main() {
  Foo foo = ({required int x, String y = "", required String z}) {};

  C.test1(x: 3, y: "");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C().test2(x: 1, y: "");
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    test3(x: 4, y: "");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    foo(x: 5, y: "");
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.test1(z: "No", y: "woman");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C().test2(z: "no", y: "cry");
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  test3(z: "No", y: "woman");
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  foo(z: "No", y: "woman");
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}
