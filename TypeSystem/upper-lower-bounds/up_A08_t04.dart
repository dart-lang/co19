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
/// @description Check that UP(`X1 & B1`, `T2`) = `T2` if `T2 != X1 & B1`,
/// not TOP(`T2`), `T2` is not an intersection type, not BOTTOM(`T2`) and
/// `X1 <: T2`. We also use the fact that TOP(`X1 & B1`) never holds.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void test1<T1 extends num, T2 extends T1>(
  T1 Function(T1 x) f1,
  T2 Function(T2 x) f2,
) {
  if (f1 is T2 Function(T1 x)) {
    var v1 = (1 > 2) ? f1 : f2;
    v1.expectStaticType<Exactly<T2 Function(T2 x)>>();
  }
}

void test2<T1 extends num, T2 extends T1>(
    T1 Function({T1 x}) f1,
    T2 Function({T2 x}) f2,
    ) {
  if (f1 is T2 Function({T1 x})) {
    var v1 = (1 > 2) ? f1 : f2;
    v1.expectStaticType<Exactly<T2 Function({T2 x})>>();
  }
}

main() {
  test1((x) => 1, (x) => 2);
  test2(({x}) => 1, ({x}) => 2);
}
