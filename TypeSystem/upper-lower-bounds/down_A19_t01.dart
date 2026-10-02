// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T Function<...>(...)`, `S Function<...>(...)`) = `Never` otherwise
///
/// @description Check that DOWN(`T Function<...>(...)`, `S Function<...>(...)`)
/// = `Never` if the conditions of the previous function-type cases are not met
/// (i.e. they have different bounds for type parameters, different number of
/// type parameters, different number of positional parameters when named
/// parameters are present, etc.).
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, or
/// BOTTOM, or of the form `T?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

typedef Num = num;
typedef Int = int;

void f1(
  void Function(int Function<X extends num>(X)) v1,
  void Function(num Function<X extends int>(X)) v2,
) {
  // Different type parameter bounds.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2(
  void Function(int Function<X extends num>(X)) v1,
  void Function(num Function<X extends num, Y extends num>(X)) v2,
) {
  // Different number of type parameters.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3(
  void Function(int Function<X extends num>(X)) v1,
  void Function(num Function(num)) v2,
) {
  // Generic vs non-generic function type.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4(
  void Function(int Function<X extends Num>(X)) v1,
  void Function(num Function<X extends Int>(X)) v2,
) {
  // Different type parameter bounds.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5(
  void Function(int Function<X extends num>(X, {int a})) v1,
  void Function(num Function<X extends num>(X, int)) v2,
) {
  // One function type has named parameters, the other has an extra positional
  // parameter, so the previous named case (same `k`) does not apply.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6(
  void Function(int Function<X extends num>(X, {required int a})) v1,
  void Function(num Function<X extends num>(X, num, {required int a})) v2,
) {
  // Different number of positional parameters, both with named parameters.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7(
  void Function(int Function({int a})) v1,
  void Function(num Function(int)) v2,
) {
  // Same rule with no type parameters: named vs positional.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8(
  void Function(int Function([int])) v1,
  void Function(num Function({int a})) v2,
) {
  // Optional positional vs named.
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8((x) {}, (x) {});
}
