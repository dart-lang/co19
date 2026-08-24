// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T0 Function<X0 extends B00, ... Xm extends B0m>(P00, ... P0k)`,
///      `T1 Function<X0 extends B10, ... Xm extends B1m>(P10, ... P1l)`) =
///   `R0 Function<X0 extends B20, ..., Xm extends B2m>(P20, ..., P2q)` if:
///     - each `B0i` and `B1i` are equal types (syntactically)
///     - Both have the same number of required positional parameters
///     - `q` is min(`k`, `l`)
///     - `R0` is UP(`T0`, `T1`)
///     - `B2i` is `B0i`
///     - `P2i` is DOWN(`P0i`, `P1i`)
///
/// @description Check a representative case of
/// UP(`T Function<X extends B>(P0, [P01])`, `S Function<X extends B>(P1, [P11])`) =
/// UP(`T`, `S`) Function<X extends B>(DOWN(`P0`, `P1`), [DOWN(`P01`, `P11`)]).
/// Test an intersection type.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void test<T1 extends num, T2 extends T1>(
  T1 Function(T1 x) f1,
  T2 Function(T2 x) f2,
) {
  if (f1 is T2 Function(T1 x)) {
    var v1 = (1 > 2) ? f1 : f2;
    v1.expectStaticType<Exactly<T2 Function(T2 x)>>();
  }
}

main() {
  test((x) => 1, (x) => 2);
}
