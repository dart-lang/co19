/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the static type of e in the expression 'throw e'
 * is not assignable to Object
 *
 * @description Check that it is an error if the static type of e in the
 * expression throw e is not assignable to Object. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
class A {
}

typedef NullAlias = Null;
typedef AAlias = A?;
typedef ObjectAlias = Object?;
typedef FunctionAlias = Function?;

void test1(NullAlias x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2(AAlias x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3(FunctionAlias x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test4<T extends NullAlias>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test5<T extends ObjectAlias>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test6<T extends FunctionAlias>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
