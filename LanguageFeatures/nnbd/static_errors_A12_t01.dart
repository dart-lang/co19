// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a required named parameter is not bound to an
/// argument at a call site.
///
/// @description Check that it is an error a required named parameter is not
/// bound to an argument at a call site
/// @author sgrekhov@unipro.ru

class C {
  static void test1({required int x}) {}
  void test2({required int x}) {}
}

void test3({required int x}) {}

typedef void Foo({required int x});

main() {
  C.test1();
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C().test2();
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  test3();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Foo foo = ({required int x}) {};
  foo();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}
