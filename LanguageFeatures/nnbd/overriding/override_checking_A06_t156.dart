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
 * @description Check that [NNBD_TOP_MERGE(Null*, Never*)] is [Null].
 *
 * @Issue 40541
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class C1 extends out_Null implements out_Never {}
class C2 extends out_Never implements out_Null {}

main() {
  Expect.isTrue(C1().f is Null Function(Null));
  Expect.isTrue(C2().f is Null Function(Null));
}
