/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for the initializer expression of a late local
 * variable to use a prefix await expression that is not nested inside of
 * another function expression.
 *
 * @description Check that it is an error for the initializer expression of a
 * late local variable to use a prefix await expression.
 * @author sgrekhov@unipro.ru
 * @issue 39661
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

class C {
  static void sTest() async {
    late int i = await 42;
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void mTest() async {
    late int i = await 42;
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test() async {
  late int i = await 42;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() async {
  late int i = await 42;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  test();
  C.sTest();
  C().mTest();
}
