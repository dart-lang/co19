// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic function declaration introduces a generic function into
/// the enclosing scope. Consider a function invocation expression of the form
/// [f<T1, . . . , Tl>(...)], where the static type of [f] is a generic function
/// type with formal type parameters [X1 extends B1], . . . , [Xm extends Bm].
/// ...
/// It is a compile-time error if there exists a [j] such that [Tj] is not a
/// subtype of [T1/X1, . . . , Tm/Xm]Bj.
/// @description checks that error appears if some parameter type is incorrect.
/// @author iarkh@unipro.ru


class A {}
class B extends A {}
class C extends B {}
class D {}

void testme1<T>() {}
void testme2<T extends A>() {}
void testme3<T extends B>() {}
void testme4<T extends C>() {}
void testme5<T extends D>() {}


main() {
  testme1<A>();
  testme1<B>();
  testme1<C>();
  testme1<D>();

  testme2<A>();
  testme2<B>();
  testme2<C>();
  testme2<D>();
//^
// [cfe] Type argument 'D' doesn't conform to the bound 'A' of the type variable 'T' on 'testme2'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

  testme3<A>();
//^
// [cfe] Type argument 'A' doesn't conform to the bound 'B' of the type variable 'T' on 'testme3'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme3<B>();
  testme3<C>();
  testme3<D>();
//^
// [cfe] Type argument 'D' doesn't conform to the bound 'B' of the type variable 'T' on 'testme3'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

  testme4<A>();
//^
// [cfe] Type argument 'A' doesn't conform to the bound 'C' of the type variable 'T' on 'testme4'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme4<B>();
//^
// [cfe] Type argument 'B' doesn't conform to the bound 'C' of the type variable 'T' on 'testme4'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme4<C>();
  testme4<D>();
//^
// [cfe] Type argument 'D' doesn't conform to the bound 'C' of the type variable 'T' on 'testme4'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

  testme5<A>();
//^
// [cfe] Type argument 'A' doesn't conform to the bound 'D' of the type variable 'T' on 'testme5'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme5<B>();
//^
// [cfe] Type argument 'B' doesn't conform to the bound 'D' of the type variable 'T' on 'testme5'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme5<C>();
//^
// [cfe] Type argument 'C' doesn't conform to the bound 'D' of the type variable 'T' on 'testme5'.
//        ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme5<D>();
}
