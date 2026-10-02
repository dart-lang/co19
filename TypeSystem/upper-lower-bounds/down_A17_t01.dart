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
/// @description Check a representative case of
/// DOWN(`T Function<X extends B>(P0, [P01])`,
///      `S Function<X extends B>(P1, [P11])`) =
/// DOWN(`T`, `S`) Function<X extends B>(UP(`P0`, `P1`), [UP(`P01`, `P11`)]).
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, BOTTOM,
/// or of the form `T?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

typedef Num = num;
typedef Int = int;

void f1(
  void Function(int Function<X extends num>(X, num, [int])) v1,
  void Function(num Function<X extends num>(X, int, [num])) v2,
) {
  // - R0 = DOWN(int, num) = int
  // - P20 = UP(X, X) = X
  // - P21 = UP(num, int) = num
  // - P22 = UP(int, num) = num, optional
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, num, [num]))>>();
}

void f2(
  void Function(int Function<X extends num>(X, num, [int])) v1,
  void Function(Num Function<X extends Num>(X, Int, [Num])) v2,
) {
  // Type aliases are expanded, so the bounds are syntactically `num`.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, num, [num]))>>();
}

void f3(
  void Function(int Function(num, [int])) v1,
  void Function(num Function(int, [num])) v2,
) {
  // Same rule with no type parameters.
  // DOWN(int Function(num, [int]), num Function(int, [num])) =
  // int Function(num, [num])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function(num, [num]))>>();
}

void f4(
  void Function(int Function<X extends num>(X, int)) v1,
  void Function(num Function<X extends num>(X, [num])) v2,
) {
  // P21 is optional because it is optional in the second type.
  // DOWN(...) = int Function<X extends num>(X, [num])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, [num]))>>();
}

void f5(
  void Function(int Function<X extends num, Y extends Object>(X, Y)) v1,
  void Function(num Function<X extends num, Y extends Object>(X, Y)) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<
          void Function(int Function<X extends num, Y extends Object>(X, Y))>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
}
