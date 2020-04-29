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
 * @description Check that NNBD_TOP_MERGE works correctlt for legacy
 * [FutureOr] and [void] types.
 *
 * @Issue 40454
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class B extends A_OUT<void> {}

class in_FutureOr extends out_FutureOr implements B {}
class in_FutureOr_FutureOr extends out_FutureOr_FutureOr implements B {}

class in_FutureOr1 extends B implements out_FutureOr {}
class in_FutureOr_FutureOr1 extends B implements out_FutureOr_FutureOr {}

main() {
  Expect.isTrue(in_FutureOr().f is dynamic Function(dynamic));
  Expect.isTrue(in_FutureOr1().f is dynamic Function(dynamic));

  Expect.isTrue(in_FutureOr_FutureOr().f is dynamic Function(dynamic));
  Expect.isTrue(in_FutureOr_FutureOr1().f is dynamic Function(dynamic));
}
