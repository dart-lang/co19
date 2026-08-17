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
/// @description Check that UP(`T1`, `X2 & B2`) = `T1` if `T1 != X2 & B2`,
/// not TOP(`T1`), not BOTTOM(`T1`) and `X2 <: T1`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// ignore_for_file: dead_code

class A {}
class B2 extends A {}

void f1<T1, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}


void f2<T1 extends A, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f3<T1 extends num, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f4<T1 extends Null, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f5<T1 extends Function, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f6<T1 extends Record, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f7<T1 extends FutureOr<num>, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f8<T1 extends num?, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f9<T1 extends D<num, Object>, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f10<T1 extends FPositional, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f11<T1 extends FNamed, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f12<T1 extends Rec, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f13<T1 extends Enum, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f14<T1 extends ET, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void main() {
  f1<num, int>(1, 2);
  f2<A, B2>(A(), B2());
  f3(1, 2);
  f4<Null, Null>(null, null);
  f5<FPositional, FPositional>(fPositional, fPositional);
  f6<Rec, Rec>((1, '2', b: true), (1, '2', b: true));
  f7<FutureOr<num>, FutureOr<int>>(1, Future.value(2));
  f8<num?, int?>(1, null);
  f9(D<num, Object>(), D<int, String>());
  f10(fPositional, fPositional2);
  f11(fNamed, fNamed2);
  f12((1 as num, 's' as Pattern, b: true), (1, 's', b: false));
  f13<E, E>(E.e0, E.e0);
  f14(ET(2), ET2(ET(1)));
}
