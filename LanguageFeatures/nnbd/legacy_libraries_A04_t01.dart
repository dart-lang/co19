/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  In a legacy library, none of the new syntax introduced by this
 * proposal is available, and it is a static error if it is used.
 *
 * @description Check that it is a static error if NNBD syntax is used in a
 * pre-NNBD legacy library
 * @author sgrekhov@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable

class A {}

class C {
  static String? s;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  String? v;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  int? foo() => 42;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  void bar(int? x) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A? a = null;
// ^
// [analyzer] unspecified
// [cfe] unspecified

  a = (A?) a;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  int? i = 42;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  int? foo() => 42;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  void bar(int? x) {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
