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
 * [Object] and [dynamic], [void] and [Null].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A<T> {}
class B implements A<Object> {}

class C_dynamic implements A<dynamic> {}
class C_void implements A<void> {}
class C_Null implements A<Null> {}

class D_dynamic extends B implements C_dynamic {}
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_dynamic1 extends C_dynamic implements B {}
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_void extends B implements C_void {}
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_void1 extends C_void implements B {}
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_Null extends B implements C_Null {}
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_Null1 extends C_Null implements B {}
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void main() {}
