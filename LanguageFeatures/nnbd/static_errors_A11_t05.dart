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
class C<T extends num> {
  static void test1<T extends num>({required T? x = null}) {}
//                                              ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void test2<T extends num>(int x, {required T? t = null}) {}
//                                                     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void test3<T extends num>(int x, {required T? y = null, String z = ""}) {}
//                                                     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test4({required T? x = null}) {}
//                        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test5(int x, {required T? t = null}) {}
//                               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void test6(int x, {required T? y = null, int z = 42}) {}
//                               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void test7<T extends num>({required T? x = null}) {}
//                                     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void test8<T extends num>(int x, {required T? t = null}) {}
//                                            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void test9<T extends num>(int x, {required T? y = null, int z = 42}) {}
//                                            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
