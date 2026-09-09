// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`X1 & B1`, `T2`) =
///   - `T2` if `X1 <: T2`
///   - otherwise `X1` if `T2` <: `X1`
///   - otherwise UP(`B1a`, `T2`) where `B1a` is the greatest closure of `B1`
///     with respect to `X1`, as defined in inference.md.
///
/// @description Check that UP(`X1 & B1`, `T2`) = UP(`B1a`, `T2`) where `B1a` is
/// the greatest closure of `B1` with respect to `X1` if the first two
/// conditions are not met and also `T2 != X1 & B1`, not TOP(`T2`), `T2` is not
/// an intersection type and not BOTTOM(`T2`). We also use the fact that
/// TOP(`X1 & B1`) never holds.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class A {}
class A2 extends A {}
class B1 extends A2 {}

void f1<X1 extends A, T2 extends A2>(X1 x1, T2 t2) {
  if (x1 is B1) { // `x1` promoted to `X1 & B1`.
    // UP(X1 & B1, T2) = UP(B1a, T2), where B1a is the greatest closure of `B1`
    // with respect to `X1` (`B1` in this case with respect to anything) and
    // UP(`B1a`, `T2`) == UP(`B1`, `T2`) = `A2`.
    var v = (1 > 2) ? x1 : t2;
    v.expectStaticType<Exactly<A2>>();
  }
}

void f2<X1 extends A2, T2 extends A2, B1 extends A2>(X1 x1, T2 t2) {
  if (x1 is B1) { // `x1` promoted to `X1 & B1`.
    // UP(X1 & B1, T2) = UP(B1a, T2), where B1a is
    // the greatest closure of `B1` with respect to `X1` (which is again `B1`).
    var v = (1 > 2) ? x1 : t2;
    v.expectStaticType<Exactly<A2>>();
  }
}

void main() {
  f1(A2(), A2());
  f2(A2(), A2());
}
