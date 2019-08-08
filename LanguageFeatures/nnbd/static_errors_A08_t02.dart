/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a required named parameter has a default value.
 *
 * @description Check that it is an error if a required named parameter has a
 * default value.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {
  const A();
}

const a = const A();

class C {
  static void test1(A x = a) {}                     //# 01: compile-time error
  static void test2(A x = a, [String s = ""]) {}    //# 02: compile-time error
  static void test3(A x = a, {String s = ""}) {}    //# 03: compile-time error

  void test4(A x = a) {}                            //# 04: compile-time error
  void test5(A x = a, [String s = ""]) {}           //# 05: compile-time error
  void test6(A x = a, {String s = ""}) {}           //# 06: compile-time error
}

void test7(A x = a) {}                              //# 07: compile-time error
void test8(A x = a, [String s = ""]) {}             //# 08: compile-time error
void test9(A x = a, {String s = ""}) {}             //# 09: compile-time error

main() {
}
