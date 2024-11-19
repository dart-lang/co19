// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if the static type of e in the expression 'throw e'
/// is not assignable to Object
///
/// @description Check that it is an error if the static type of e in the
/// expression throw e is not assignable to Object
/// @author sgrekhov@unipro.ru

class A {
}

void test1(Null x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2(A? x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3(Function? x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test4<T extends Null>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test5<T extends Object?>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test6<T extends Function?>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(Object? _) {}

void test7(ET x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
}
