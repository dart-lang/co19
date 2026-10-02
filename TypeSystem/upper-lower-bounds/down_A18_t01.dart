// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T0 Function<X0 extends B00, ..., Xm extends B0m>(P00, ... P0k,
///        Named0)`,
///      `T1 Function<X0 extends B10, ..., Xm extends B1m>(P10, ... P1k,
///        Named1)`) =
///   `R0 Function<X0 extends B20, ..., Xm extends B2m>(P20, ..., P2k, Named2)`
///   if:
///     - each `B0i` and `B1i` are equal types (syntactically)
///     - `R0` is DOWN(`T0`, `T1`)
///     - `B2i` is `B0i`
///     - `P2i` is UP(`P0i`, `P1i`)
///     - `Named2` contains `R2i xi` for each `xi` in both `Named0` and `Named1`
///       - where `R0i xi` is in `Named0`
///       - where `R1i xi` is in `Named1`
///       - and `R2i` is UP(`R0i`, `R1i`)
///       - and `R2i xi` is required if `xi` is required in both `Named0` and
///         `Named1`
///     - `Named2` contains `R0i xi` for each `xi` in `Named0` and not `Named1`
///       - where `xi` is optional in `Named2`
///     - `Named2` contains `R1i xi` for each `xi` in `Named1` and not `Named0`
///       - where `xi` is optional in `Named2`
///
/// @description Check a representative case of DOWN of two generic function
/// types with the same named parameters: the return type is DOWN, positional
/// and named parameter types are UP, and a named parameter is required only if
/// it is required in both types.
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, BOTTOM,
/// or of the form `T?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

typedef Num = num;
typedef Int = int;

void f1(
  void Function(int Function<X extends num>(X, int, {required int a})) v1,
  void Function(num Function<X extends num>(X, num, {required num a})) v2,
) {
  // - R0 = DOWN(int, num) = int
  // - P20 = UP(X, X) = X
  // - P21 = UP(int, num) = num
  // - Named `a`: UP(int, num) = num, required
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<
          void Function(
              int Function<X extends num>(X, num, {required num a}))>>();
}

void f2(
  void Function(int Function<X extends num>(X, num, {int a})) v1,
  void Function(num Function<X extends num>(X, int, {num a})) v2,
) {
  // Named `a` is optional in both, so it stays optional.
  // DOWN(...) = int Function<X extends num>(X, num, {num a})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, num, {num a}))>>();
}

void f3(
  void Function(int Function<X extends num>(X, int, {required int a})) v1,
  void Function(num Function<X extends num>(X, num, {num a})) v2,
) {
  // `a` is required in only one type, so it is optional in the result.
  // DOWN(...) = int Function<X extends num>(X, num, {num a})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function<X extends num>(X, num, {num a}))>>();
}

void f4(
  void Function(int Function<X extends num>(X, int, {required int a})) v1,
  void Function(Num Function<X extends Num>(X, Num, {required Num a})) v2,
) {
  // Type aliases are expanded, so the bounds are syntactically `num`.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<
          void Function(
              int Function<X extends num>(X, num, {required num a}))>>();
}

void f5(
  void Function(int Function(int, {required int a})) v1,
  void Function(num Function(num, {required num a})) v2,
) {
  // Same rule with no type parameters.
  // DOWN(int Function(int, {required int a}), num Function(num, {required num a}))
  // = int Function(num, {required num a})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
      Exactly<void Function(int Function(num, {required num a}))>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
}
