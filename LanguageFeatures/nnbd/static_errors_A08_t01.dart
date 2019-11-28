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
// Requirements=nnbd-strong

class C {
  static void test1({required int x = 0}) {}
//                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void test2(int x, {required String s = ""}) {}
//                                            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void test3(int x, {required String? y = "", String z = ""}) {}
//                                             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test4({required int x = 0}) {}
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test5(int x, {required String s = ""}) {}
//                                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test6(int x, {required String? y = "", int z = 42}) {}
//                                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void test7({required int x = 0}) {}
//                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void test8(int x, {required String s = ""}) {}
//                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void test9(int x, {required String? y = "", int z = 42}) {}
//                                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  var f1 = ({required int x = 0}) {};
//                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var f2 = (int x, {required String s = ""}) {};
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var f3 = (int x, {required String? y = "", int z = 42}) {};
//                                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
