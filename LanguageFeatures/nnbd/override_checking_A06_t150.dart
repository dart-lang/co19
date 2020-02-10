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
 * @description Check that error occurs as a result of the following cases:
 *
 *    [NNBD_TOP_MERGE(Never, FutureOr)].
 *    [NNBD_TOP_MERGE(Never, FutureOr<int>)].
 *    [NNBD_TOP_MERGE(Never, FutureOr<int?>)].
 *    [NNBD_TOP_MERGE(Never, FutureOr<FutureOr>)].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "dart:async";

class A<T> {}

class B implements A<Never> {}

class C1 implements A<FutureOr> {}
class C2 implements A<FutureOr<int>> {}
class C3 implements A<FutureOr<int?>> {}
class C4 implements A<FutureOr<FutureOr>> {}

class D1 extends B implements C1 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D2 extends C1 implements B {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D3 extends B implements C2 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D4 extends C2 implements B {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D5 extends B implements C3 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D6 extends C3 implements B {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D7 extends B implements C4 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D8 extends C4 implements B {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

void main() {}
