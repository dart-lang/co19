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
 * @description Check that error does not occue as a result of [NNBD_TOP_MERGE(
 * FutureOr<FutureOr>, void)].
 *
 * @Issue 41576
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "dart:async";
import "../../../Utils/expect.dart";

class A<T> { Type getType() => T; }

class B extends A<FutureOr<FutureOr>> {}
class C extends A<void>  {}

class D1 extends B implements C {}
class D2 extends C implements B {}

void main() {
  A<Object?> d1 = D1();
  A<Object?> d2 = D2();

  Expect.equals(typeOf<FutureOr<FutureOr>>(), d1.getType());
  Expect.equals(typeOf<void>(), d2.getType());

  Expect.isTrue(D1() is A<Object?>);
  Expect.isTrue(D1() is A<Object?>);
}
