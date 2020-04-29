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
 * @description Check that result of [NNBD_TOP_MERGE] of [Object?] vs [dynamic*]
 * and [void*] is [Object?].
 *
 * @Issue 40541, 40453
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class B extends A_OUT<Object?> {}

class in_dynamic1 extends out_dynamic implements B {}
class in_dynamic2 extends B implements out_dynamic {}

class in_void1 extends out_void implements B {}
class in_void2 extends B implements out_void {}

main() {
  Expect.isTrue(in_dynamic1().f is Object? Function(Object?));
  Expect.isTrue(in_dynamic2().f is Object? Function(Object?));

  Expect.isTrue(in_void1().f is Object? Function(Object?));
  Expect.isTrue(in_void2().f is Object? Function(Object?));
}
