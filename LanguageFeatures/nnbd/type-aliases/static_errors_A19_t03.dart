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
 * expression throw e is not assignable to Object. Test legacy types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-weak
import "../legacy_lib.dart";

typedef AAlias = A?;

void test1(AAlias x) {
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

void test3(LegacyFoo? x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test4<T extends AAlias>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test5<T extends A?>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test6<T extends LegacyFoo?>(T x) {
  throw x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
