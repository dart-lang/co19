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
/// @description Check that result of [NNBD_TOP_MERGE(FutureOr, Object?)] is
/// [FutureOr].
/// @author iarkh@unipro.ru
/// @Issue 40454,40541,41576

import "dart:async";
import "../../../Utils/expect.dart";

class B extends CheckTopMerge<FutureOr> {}
class C extends CheckTopMerge<Object? > {}

class D1 extends C implements B {}
class D2 extends B implements C {}

main() {
  Expect.isTrue(D1().f is Object? Function(Object?));
  Expect.isTrue(D2().f is Object? Function(Object?));
  Expect.runtimeIsType<Object? Function(Object?)>(D1().f);
  Expect.runtimeIsType<Object? Function(Object?)>(D2().f);
}
