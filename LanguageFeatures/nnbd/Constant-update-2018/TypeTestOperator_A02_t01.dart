/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form [e is T] or [e is! T] is accepted as a
 * potentially and compile-time constant expression if [e] is potentially
 * constant or compile-time constant, respectively, and [T] is a compile-time
 * constant type.
 * @description Checks that an expression of the form [e is T] is accepted if
 * [e] is a compile-time constant
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../../Utils/expect.dart";

const i = 0;
const i1 = "12345";

class MyClass1 {
  final int res;
  const MyClass1() : res = (i is int && i > 0 ? i : -1);
}

class MyClass2 {
  final int res;
  const MyClass2() : res = (i1 is int && i > 0 ? i1 as int : -1);
}

main() {
  const bool i_int = i is int;
  Expect.isTrue(i_int);

  const bool i_str = i is String;
  Expect.isFalse(i_str);

  const bool i1_int = i1 is int;
  Expect.isFalse(i1_int);

  const bool i1_str = i1 is String;
  Expect.isTrue(i1_str);

  const MyClass1 c1 = MyClass1();
  Expect.equals(-1, c1.res);

  const MyClass2 c2 = MyClass2();
  Expect.equals(-1, c2.res);
}
