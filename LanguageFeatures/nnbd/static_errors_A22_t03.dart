/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for the initializer expression of a late local
 * variable to use a prefix await expression that is not nested inside of
 * another function expression.
 *
 * @description Check that it is not an error for the initializer expression of
 * a late local variable to use a prefix await expression if it is nested inside
 * of another function expression
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

class C {
  static void sTest() async {
    late Future<int> i = init();
  }

  void mTest() async {
    late Future<int> i = init();
  }
}

void test() async {
  late Future<int> i = init();
}

Future<int> init() async {
  return await 42;
}

main() async {
  late Future<int> i = init();
  test();
  C.sTest();
  C().mTest();
}
