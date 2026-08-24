// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T0 Function<X0 extends B00, ... Xm extends B0m>(P00, ... P0k, Named0)`,
///      `T1 Function<X0 extends B10, ... Xm extends B1m>(P10, ... P1k, Named1)`) =
///   `R0 Function<X0 extends B20, ..., Xm extends B2m>(P20, ..., P2k, Named2)` if:
///   - each `B0i` and `B1i` are equal types (syntactically)
///   - All positional parameters are required
///   - `Named0` contains an entry (optional or required) of the form `R0i xi`
///     for every required named parameter `R1i xi` in `Named1`
///   - `Named1` contains an entry (optional or required) of the form `R1i xi`
///     for every required named parameter `R0i xi` in `Named0`
///   - The result is defined as follows:
///     - `R0` is **UP**(`T0`, `T1`)
///     - `B2i` is `B0i`
///     - `P2i` is **DOWN**(`P0i`, `P1i`)
///     - `Named2` contains exactly `R2i xi` for each `xi` in both `Named0` and
///       `Named1`
///     - where `R0i xi` is in `Named0`
///     - where `R1i xi` is in `Named1`
///     - and `R2i` is **DOWN**(`R0i`, `R1i`)
///     - and `R2i xi` is required if `xi` is required in either `Named0` or
///       `Named1`
///
/// @description Check a representative case of
/// UP(`T0 Function<X extends B0>(P0, {required P0i xi})`,
///    `T1 Function<X extends B1>(P1, {required P1i xi})`) where:
///  - `R0` is UP(`T0`, `T1`)
///  - `P2i` is DOWN for the single named parameter
/// Test an intersection type.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void test<T1 extends num, T2 extends T1>(
  T1 Function({T1 x}) f1,
  T2 Function({T2 x}) f2,
) {
  if (f1 is T2 Function({T1 x})) {
    var v1 = (1 > 2) ? f1 : f2;
    v1.expectStaticType<Exactly<T2 Function({T2 x})>>();
  }
}

main() {
  test(({x}) => 1, ({x}) => 2);
}
