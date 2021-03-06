// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a class [C] in an opted-in library implements the same generic
/// class [I] more than once as [I0], .., [In], and at least one of the [Ii] is
/// not syntactically equal to the others, then it is an error if
/// [NNBD_TOP_MERGE(S0, ..., Sn)] is not defined where [Si] is [NORM(Ii)].
/// Otherwise, for the purposes of runtime subtyping checks, [C] is considered to
/// implement the canonical interface given by [NNBD_TOP_MERGE(S0, ..., Sn)].
///
/// @description Check that error occurs for the following cases:
///   NNBD_TOP_MERGE(Null*, dynamic*)
///   NNBD_TOP_MERGE(Null*, void*)
///   NNBD_TOP_MERGE(Null*, FutureOr*)
///   NNBD_TOP_MERGE(Null*, FutureOr<int>*)
///   NNBD_TOP_MERGE(Null*, FutureOr<FutureOr>*)
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "override_checking_A06_opted_out_lib.dart";

class C1 extends out_Null implements out_dynamic {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends out_dynamic implements out_Null {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3 extends out_Null implements out_void {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4 extends out_void implements out_Null {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C5 extends out_Null implements out_FutureOr {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C6 extends out_FutureOr implements out_Null {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C7 extends out_Null implements out_FutureOr_int {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C8 extends out_FutureOr_int implements out_Null {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C9 extends out_Null implements out_FutureOr_FutureOr {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C10 extends out_FutureOr_FutureOr implements out_Null {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
