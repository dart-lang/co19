/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if an optional parameter (named or otherwise) with
 * no default value has a potentially non-nullable type.
 *
 * @description Check that it is a compile-time error if an optional parameter
 * (named or otherwise) with no default value has a potentially non-nullable
 * type. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class A {
  static void test1(var x, [A a]) {}
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  static void test2(var x, {A a}) {}
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

typedef AAlias = A?;

class C<X extends AAlias> {
  X x;
  C(this.x);

  void test1<X extends AAlias>(var x, [X x]) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

  void test2<X extends AAlias>(var x, {X x}) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test1<X extends AAlias>(var x, [X x]) {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

void test2<X extends AAlias>(var x, {X x}) {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  AAlias a = new A();
  C<AAlias> c = new C<AAlias>(a);
}
