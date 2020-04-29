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
 * @description Check that compile error does not occur as a result of
 * [NNBD_TOP_MERGE(FutureOr<FutureOr>, FutureOr*)].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "override_checking_A06_opted_out_lib.dart";
import "../../../Utils/expect.dart";

class B extends A<FutureOr<FutureOr>> {}

class C1 extends out_FutureOr implements B {}
class C2 extends B implements out_FutureOr {}

main() {
  Expect.isTrue(C1().f is FutureOr Function(FutureOr));
  Expect.isTrue(C2().f is FutureOr Function(FutureOr));
}
