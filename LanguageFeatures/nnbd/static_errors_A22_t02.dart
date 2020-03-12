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
 * @description Check that it is not an error if late variable has no
 * initializing expression and then assigned with a prefix await.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "../../Utils/expect.dart";

class C {
  static void sTest() async {
    late int i;
    i = await 42;
    Expect.equals(42, i);
  }

  void mTest() async {
    late int i;
    i = await 42;
    Expect.equals(42, i);
  }
}

void test() async {
  late int i;
  i = await 42;
  Expect.equals(42, i);
}

main() async {
  late int i;
  i = await 42;
  Expect.equals(42, i);

  test();
  C.sTest();
  C().mTest();
}
