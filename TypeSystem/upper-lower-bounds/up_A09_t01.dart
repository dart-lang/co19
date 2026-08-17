// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `X2 & B2`) =
///   - `X2` if `T1 <: X2`
///   - otherwise `T1` if `X2 <: T1`
///   - otherwise UP(`T1`, `B2a`) where `B2a` is the greatest closure of `B2`
///     with respect to `X2`, as defined in inference.md.
///
/// @description Check that UP(`T1`, `X2 & B2`) = `X2` if `T1 != X2 & B2`,
/// not TOP(`T1`), not BOTTOM(`T1`) and `T1 <: X2`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// ignore_for_file: dead_code

class A {}
class B2 extends A {}

void f1<X2, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f2<X2 extends A, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f3<X2 extends num, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f4<X2 extends Null, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f5<X2 extends Function, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f6<X2 extends Record, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f7<X2 extends FutureOr<num>, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f8<X2 extends num?, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f9<X2 extends D<num, Object>, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f10<X2 extends FPositional, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f11<X2 extends FNamed, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f12<X2 extends Rec, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f13<X2 extends Enum, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f14<X2 extends ET, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void main() {
  f1<num, int>(1, 2);
  f2<A, B2>(B2(), A());
  f3(1, 2);
  f4<Null, Null>(null, null);
  f5<FPositional, FPositional>(fPositional, fPositional);
  f6<Rec, Rec>((1, '2', b: true), (1, '2', b: true));
  f7<FutureOr<num>, FutureOr<num>>(1, Future.value(2));
  f8<num?, num?>(1, null);
  f9(D<int, String>(), D<num, Object>());
  f10(fPositional2, fPositional);
  f11(fNamed2, fNamed);
  f12((1, 's', b: false), (1 as num, 's' as Pattern, b: true));
  f13<E, E>(E.e0, E.e0);
  f14(ET2(ET(1)), ET(2));
}
