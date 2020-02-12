/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a class [C] in an opted-in library implements the same generic
 * class [I] more than once as [I0], .., [In], and at least one of the [Ii] is
 * not syntactically equal to the others, then it is an error if
 * [NNBD_TOP_MERGE(S0, ..., Sn)] is not defined where [Si] is [NORM(Ii)].
 * Otherwise, for the purposes of runtime subtyping checks, [C] is considered to
 * implement the canonical interface given by [NNBD_TOP_MERGE(S0, ..., Sn)].
 *
 * @description Check that error occurs as a result of [NNBD_TOP_MERGE] of
 * [Object] and [int], [int?], [Function], [Function?].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A<T> {}
class B implements A<Object> {}

class C_int implements A<int> {}
class C_nullable_int implements A<int?> {}
class C_Function implements A<Function> {}
class C_nullable_Function implements A<Function?> {}

class D_int extends B implements C_int {}
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_int1 extends  C_int implements B {}
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_nullable_int extends B implements C_nullable_int {}
//    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_nullable_int1 extends C_nullable_int implements B {}
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_Function extends B implements C_Function {}
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_Function1 extends C_Function implements B {}
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_nullable_Function extends B implements C_nullable_Function {}
//    ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_nullable_Function1 extends C_nullable_Function implements B {}
//    ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void main() {}
