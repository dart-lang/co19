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
 * @description Check that result of [NNBD_TOP_MERGE] for the cases:
 *   NNBD_TOP_MERGE(int*, int*) = int?
 *   NNBD_TOP_MERGE(Function*, Function*) = Function?
 *   NNBD_TOP_MERGE(Object*, Object*) = Object?
 *
 * @Issue 40524
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class in_int extends out_int implements out_int1 {}
class in_Function extends out_Function implements out_Function1 {}
class in_Object extends out_Object implements out_Object1 {}

main() {
  Expect.isTrue(in_int().f is int? Function(int?));
  Expect.isTrue(in_Function().f is Function? Function(Function?));
  Expect.isTrue(in_Object().f is Object? Function(Object?));
}
