// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `X2 extends B2`) =
///   - `X2` if `T1 <: X2`
///   - otherwise `T1` if `X2 <: T1`
///   - otherwise UP(`T1`, `B2a`) where `B2a` is the greatest closure of `B2`
///     with respect to `X2`, as defined in inference.md.
///
/// @description Check that UP(`T1`, `X2 extends B2`) = `X2` if `T1 != X2`, none
/// of `T1` and `X2` is TOP, BOTTOM, NULL, OBJECT, `T?` or an intersection type
/// and `T1 <: X2`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X2 extends num, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends num) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f2<X2 extends C, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends C) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f3<X2 extends D<num, Object>, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends D<num, Object>) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f4<X2 extends Function, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends Function) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f5<X2 extends FPositional, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends FPositional) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f6<X2 extends FNamed, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends FNamed) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f7<X2 extends Record, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends Record) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f8<X2 extends Rec, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends Rec) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f9<X2 extends Enum, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends Enum) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f10<X2 extends E, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends E) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f11<X2 extends ET, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends ET) = X2
  v.expectStaticType<Exactly<X2>>();
}

void f12<X2 extends FutureOr<num>, T1 extends X2>(T1 t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(T1 extends X2, X2 extends FutureOr<num>) = X2
  v.expectStaticType<Exactly<X2>>();
}

void main() {
  f1<num, int>(1, 1);
  f2<C, C>(C(), C());
  f3<D<num, Object>, D<int, String>>(D<int, String>(), D<num, Object>());
  f4<Function, FPositional>(fPositional, fPositional);
  f5<FPositional, FPositional2>(fPositional2, fPositional);
  f6<FNamed, FNamed2>(fNamed2, fNamed);
  f7<Record, Rec>((1, 's', b: true), (1,));
  f8<Rec, Rec2>((1, 's', b: true), (1 as num, 's' as Pattern, b: true));
  f9<Enum, E>(E.e0, E2.e0);
  f10<E, E>(E.e0, E.e0);
  f11<ET, ET2>(ET2(ET(0)), ET(0));
  f12<FutureOr<num>, FutureOr<int>>(1, 1);
}
