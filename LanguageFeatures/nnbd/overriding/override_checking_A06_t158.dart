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
 * @description Check the result of the following cases:
 *    NNBD_TOP_MERGE(dynamic, FutureOr*)
 *    NNBD_TOP_MERGE(dynamic, FutureOr<FutureOr>*)
 *
 * @Issue 40454, 40541
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class B extends A<dynamic> {}

class C1 extends out_FutureOr implements B {}
class C2 extends out_FutureOr_FutureOr implements B {}

class C3 extends B implements out_FutureOr {}
class C4 extends B implements out_FutureOr_FutureOr {}

main() {
  Expect.isTrue(C1().f is dynamic Function(dynamic));
  Expect.isTrue(C2().f is dynamic Function(dynamic));
  Expect.isTrue(C3().f is dynamic Function(dynamic));
  Expect.isTrue(C4().f is dynamic Function(dynamic));
}
