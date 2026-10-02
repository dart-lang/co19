// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T0 Function<X0 extends B00, ..., Xm extends B0m>(P00, ... P0k)`,
///      `T1 Function<X0 extends B10, ..., Xm extends B1m>(P10, ... P1l)`) =
///   `R0 Function<X0 extends B20, ..., Xm extends B2m>(P20, ..., P2q)` if:
///     - each `B0i` and `B1i` are equal types (syntactically)
///     - `q` is max(`k`, `l`)
///     - `R0` is DOWN(`T0`, `T1`)
///     - `B2i` is `B0i`
///     - `P2i` is UP(`P0i`, `P1i`) for `i` <= min(`k`, `l`)
///     - `P2i` is `P0i` for `k` < `i` <= `q`
///     - `P2i` is `P1i` for `l` < `i` <= `q`
///     - `P2i` is optional if `P0i` or `P1i` is optional, or if min(`k`, `l`) <
///       `i` <= `q`
///
/// @description Check that if the function types have a different number of
/// positional parameters then `q` is max(`k`, `l`), the extra parameters are
/// taken from the longer type and are optional.
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, BOTTOM,
/// or of the form `T?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void f1(
  void Function(int Function<X extends num>(X, int)) v1,
  void Function(num Function<X extends num>(X)) v2,
) {
  // q = max(1, 0) = 1. P21 comes from the first type and is optional.
  // DOWN(...) = int Function<X extends num>(X, [int])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, [int]))>>();
}

void f2(
  void Function(int Function<X extends num>(X)) v1,
  void Function(num Function<X extends num>(X, int)) v2,
) {
  // q = max(0, 1) = 1. P21 comes from the second type and is optional.
  // DOWN(...) = int Function<X extends num>(X, [int])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, [int]))>>();
}

void f3(
  void Function(int Function<X extends num>(X, int, String)) v1,
  void Function(num Function<X extends num>(X)) v2,
) {
  // q = max(2, 0) = 2. Extra parameters are optional.
  // DOWN(...) = int Function<X extends num>(X, [int, String])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, [int, String]))>>();
}

void f4(
  void Function(int Function<X extends num>(X, [int])) v1,
  void Function(num Function<X extends num>(X)) v2,
) {
  // Extra parameter is already optional in the longer type.
  // DOWN(...) = int Function<X extends num>(X, [int])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, [int]))>>();
}

void f5(
  void Function(int Function(int, String)) v1,
  void Function(num Function(int)) v2,
) {
  // Same rule with no type parameters.
  // DOWN(int Function(int, String), num Function(int)) = int Function(int, [String])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function(int, [String]))>>();
}

void f6(
  void Function(int Function(int)) v1,
  void Function(num Function(int, String)) v2,
) {
  // DOWN(int Function(int), num Function(int, String)) = int Function(int, [String])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function(int, [String]))>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
}
