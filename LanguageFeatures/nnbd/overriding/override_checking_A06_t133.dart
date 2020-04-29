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
 * [Never*] vs [int], [int?], [Function], [Function?].
 * parameter.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "override_checking_A06_opted_out_lib.dart";

class I1 extends A_OUT<int> {}
class I2 extends A_OUT<int?> {}

class F1 extends A_OUT<Function> {}
class F2 extends A_OUT<Function?> {}

class C1 extends out_Never implements I1 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends out_Never implements I2 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3 extends I1 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4 extends I2 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C5 extends out_Never implements F1 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C6 extends out_Never implements F2 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C7 extends F1 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C8 extends F2 implements out_Never {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
