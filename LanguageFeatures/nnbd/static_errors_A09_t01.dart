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

class C {
  static void test1({required int x}) {}
  static void test2({required int x = 0}) {}
  void test3({required int x}) {}
  void test4({required int x = 0}) {}
}

void test5({required int x}) {}
void test6({required int x = 0}) {}

main() {
  C.test1();      //# 01: compile-time error
  C.test2();      //# 02: compile-time error
  C().test3();    //# 03: compile-time error
  C().test4();    //# 04: compile-time error
  test5();        //# 05: compile-time error
  test6();        //# 06: compile-time error
}
