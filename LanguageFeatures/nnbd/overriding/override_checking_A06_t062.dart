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
/// @description Check that the result of NNBD_TOP_MERGE(FutureOr,
/// FutureOr)] is [FutureOr].
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "dart:async";
import "../../../Utils/expect.dart";

class B extends CheckTopMerge<FutureOr> {}
class C extends CheckTopMerge<FutureOr> {}

class D extends B implements C {}

void main() {
  Expect.isTrue(D().f is FutureOr Function(FutureOr));
  Expect.runtimeIsType<FutureOr Function(FutureOr)>(D().f);
}
