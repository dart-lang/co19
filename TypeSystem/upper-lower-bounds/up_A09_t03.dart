// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `X2 & B2`) =
///   - `X2` if `T1 <: X2`
///   - otherwise `T1` if `X2 <: T1`
///   - otherwise UP(`T1`, `B2a`) where `B2a` is the greatest closure of `B2`
///     with respect to `X2`, as defined in inference.md.
///
/// @description Check that UP(`T1`, `X2 & B2`) = UP(`T1`, `B2a`) where `B2a` is
/// the greatest closure of `B2` with respect to `X2` if the first two
/// conditions are not met and also `T1 != X2 & B2`, not TOP(`T1`), `T1` is not
/// an intersection type and not BOTTOM(`T1`). We also use the fact that
/// TOP(`X2 & B2`) never holds.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {}
class A2 extends A {}
class B2 extends A2 {}

void f1<T1 extends A2, X2 extends A>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    // UP(T1, X2 & B2) = UP(T1, B2a), where B2a is the greatest closure of `B2`
    // with respect to `X2` (`B2` in this case with respect to anything) and
    // UP(`T1`, `B2a`) == UP(`T1`, `B2`) = `A2`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<A2>>();
  }
}

void f2<T1 extends A2, X2 extends A2, B2 extends A2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    // UP(T1, X2 & B2) = UP(T1, B2a), where B2a is
    // the greatest closure of `B2` with respect to `X2` (which is again `B2`).
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<A2>>();
  }
}

void main() {
  f1(A2(), A2());
  f2(A2(), A2());
}
