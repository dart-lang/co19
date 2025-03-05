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
/// @description Check that overriding works correctly as a result of
/// [NNBD_TOP_MERGE] of [FutureOr<FutureOr>]: ir's error to merge it with
/// [Object] and it's not error to merge it with nullable [Object?].
/// @author iarkh@unipro.ru

import "dart:async";

class A<T> {}
class B implements A<FutureOr<FutureOr>> {}

class C_Object implements A<Object> {}
class C_nullable_Object implements A<Object?> {}

class D_Object extends B implements C_Object {}
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_nullable_Object extends B implements C_nullable_Object {}

class D_Object1 extends C_Object implements B{}
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class D_nullable_Object1 extends C_nullable_Object implements B {}

void main() {}
