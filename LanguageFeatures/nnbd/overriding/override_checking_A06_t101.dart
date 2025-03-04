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
/// @description Check that error occurs as a result of [NNBD_TOP_MERGE] for
/// [FutureOr] vs [FutureOr<int>], [FutureOr<int?>].
/// @author iarkh@unipro.ru

import "dart:async";

class A<T> {}
class B  implements A<FutureOr>       {}
class C1 implements A<FutureOr<int>>  {}
class C2 implements A<FutureOr<int?>> {}

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

void main() {}
