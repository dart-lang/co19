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
 *    [NNBD_TOP_MERGE(Never*, FutureOr)].
 *    [NNBD_TOP_MERGE(Never*, FutureOr<int>)].
 *    [NNBD_TOP_MERGE(Never*, FutureOr<int?>)].
 *    [NNBD_TOP_MERGE(Never*, FutureOr<FutureOr>)].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "override_checking_A06_opted_out_lib.dart";

class C1 extends A_OUT<FutureOr> {}
class C2 extends A_OUT<FutureOr<int>> {}
class C3 extends A_OUT<FutureOr<int?>> {}
class C4 extends A_OUT<FutureOr<FutureOr>> {}

class D1 extends out_Never implements C1 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D2 extends C1 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D3 extends out_Never implements C2 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D4 extends C2 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D5 extends out_Never implements C3 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D6 extends C3 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D7 extends out_Never implements C4 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class D8 extends C4 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

void main() {}
