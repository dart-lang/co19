// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`X1 extends B1`, `T2`) =
///   - `T2` if `X1 <: T2`
///   - otherwise `X1` if `T2 <: X1`
///   - otherwise UP(`B1a`, `T2`) where `B1a` is the greatest closure of `B1`
///     with respect to `X1`, as defined in inference.md.
///
/// @description Check that UP(`X1 extends B1`, `T2`) = `X1` if `X1 != T2`, none
/// of `X1` and `T2` is TOP, BOTTOM, NULL, OBJECT, `T?` or an intersection type,
/// `X1 <: T2` does not hold, and `T2 <: X1`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X1 extends num, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends num, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f2<X1 extends C, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends C, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f3<X1 extends D<num, Object>, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends D<num, Object>, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f4<X1 extends Function, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Function, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f5<X1 extends FPositional, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FPositional, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f6<X1 extends FNamed, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FNamed, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f7<X1 extends Record, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Record, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f8<X1 extends Rec, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Rec, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f9<X1 extends Enum, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Enum, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f10<X1 extends E, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends E, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f11<X1 extends ET, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends ET, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void f12<X1 extends FutureOr<num>, T2 extends X1>(X1 x1, T2 t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FutureOr<num>, T2 extends X1) = X1
  v.expectStaticType<Exactly<X1>>();
}

void main() {
  f1<num, int>(1, 1);
  f2<C, C>(C(), C());
  f3<D<num, Object>, D<int, String>>(D<num, Object>(), D<int, String>());
  f4<Function, FPositional>(fPositional, fPositional);
  f5<FPositional, FPositional2>(fPositional, fPositional2);
  f6<FNamed, FNamed2>(fNamed, fNamed2);
  f7<Record, Rec>((1,), (1, 's', b: true));
  f8<Rec, Rec2>((1 as num, 's' as Pattern, b: true), (1, 's', b: true));
  f9<Enum, E>(E2.e0, E.e0);
  f10<E, E>(E.e0, E.e0);
  f11<ET, ET2>(ET(0), ET2(ET(0)));
  f12<FutureOr<num>, FutureOr<int>>(1, 1);
}
