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

class C {
  static void test1({required int x = 0}) {}                            //# 01: compile-time error
  static void test3(int x, {required String s = ""}) {}                 //# 02: compile-time error
  static void test3(int x, {required String y = "", String z = ""}) {}  //# 03: compile-time error

  void test4({required int x = 0}) {}                                   //# 04: compile-time error
  void test5(int x, {required String s = ""}) {}                        //# 05: compile-time error
  void test6(int x, {required String y = "", int z = 42}) {}            //# 06: compile-time error
}

void test7({required int x = 0}) {}                                     //# 07: compile-time error
void test8(int x, {required String s = ""}) {}                          //# 08: compile-time error
void test9(int x, {required String y = "", int z = 42}) {}              //# 09: compile-time error

main() {
  var f1 = ({required int x = 0}) {};                         //# 10: compile-time error
  var f2 = (int x, {required String s = ""}) {};              //# 11: compile-time error
  var f3 = (int x, {required String y = "", int z = 42}) {};  //# 12: compile-time error
}
