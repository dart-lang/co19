/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The modifier required is added as a built-in identifier. The
 * grammar of function types is extended to allow any named parameter
 * declaration to be prefixed by the required modifier (e.g. int Function(int,
 * {int? y, required int z}).
 *
 * @description Check that it is a compile error if 'required' modifier is
 * misplaced
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

class C {
  static String staticTest1(required int x, {String z = "", required String y}) => y;
//                          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticTest2(int x, [String z = "", required String y]) => y;
//                                                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticTest3(int x, {String z = "", final required String y}) => y;
//                                                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  String test1(int x, [required String z = "",  String y = ""]) => y;
//                    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String test2(required int x, {String z = "", required String y}) => y;
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A test3(int x, {String z = "", covariant required  A y}) => y;
//                                         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String test4(int x, {String z = "", final required String y}) => y;
//                                          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

String test1(required int x, {String z = "", required String y}) => y;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String test2(int x, [String z = "", required String y]) => y;
//                                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String test3(int x, {String z = "", final required String y}) => y;
//                                        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
