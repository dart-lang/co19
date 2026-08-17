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

void f3(int t1, num x2) {
  if (x2 is B2) { // `x2` promoted to `num & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(int, num & B2) = num because int <: num
    v.expectStaticType<Exactly<num>>();
  }
}

void f4(String? t1, Null x2) {
  if (x2 is B2) { // `x2` promoted to `Null & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(String?, Null & B2) = String? because String? <: Null
    v.expectStaticType<Exactly<String?>>();
  }
}

void f5(FPositional t1, Function x2) {
  if (x2 is B2) { // `x2` promoted to `Function & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FPositional, Function & B2) = Function because FPositional <: Function
    v.expectStaticType<Exactly<Function>>();
  }
}

void f6((int,) t1, Record x2) {
  if (x2 is B2) { // `x2` promoted to `Record & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP((int,), Record & B2) = Record because (int,) <: Record
    v.expectStaticType<Exactly<Record>>();
  }
}

void f7(FutureOr<int> t1, FutureOr<num> x2) {
  if (x2 is B2) { // `x2` promoted to `FutureOr<num> & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FutureOr<int>, FutureOr<num> & B2) = FutureOr<num> because FutureOr<int> <: FutureOr<num>
    v.expectStaticType<Exactly<FutureOr<num>>>();
  }
}

void f8(int? t1, num? x2) {
  if (x2 is B2) { // `x2` promoted to `num? & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(int?, num? & B2) = num? because int? <: num?
    v.expectStaticType<Exactly<num?>>();
  }
}

void f9(D<int, String> t1, D<num, Object> x2) {
  if (x2 is B2) { // `x2` promoted to `D<num, Object> & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(D<int, String>, D<num, Object> & B2) = FutureOr<num> because D<int, String> <: D<num, Object>
    v.expectStaticType<Exactly<D<num, Object>>>();
  }
}

void f10(FPositional2 t1, FPositional x2) {
  if (x2 is B2) { // `x2` promoted to `FPositional & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FPositional2, FPositional & B2) = FPositional because FPositional2 <: FPositional
    v.expectStaticType<Exactly<FPositional>>();
  }
}

void f11(FNamed2 t1, FNamed x2) {
  if (x2 is B2) { // `x2` promoted to `FNamed & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FNamed2, FNamed & B2) = FNamed because FNamed2 <: FNamed
    v.expectStaticType<Exactly<FNamed>>();
  }
}

void f12(Rec2 t1, Rec x2) {
  if (x2 is B2) { // `x2` promoted to `Rec & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(Rec2, Rec & B2) = Rec because Rec2 <: Rec
    v.expectStaticType<Exactly<Rec>>();
  }
}

void f13(E t1, Enum x2) {
  if (x2 is B2) { // `x2` promoted to `Enum & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(E, Enum & B2) = Rec because E <: Enum
    v.expectStaticType<Exactly<Enum>>();
  }
}

void f14(ET2 t1, ET x2) {
  if (x2 is B2) { // `x2` promoted to `ET & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(ET2, ET & B2) = ET because ET2 <: ET
    v.expectStaticType<Exactly<ET>>();
  }
}

void main() {
  f1<num, int>(1, 2);
  f2<A, B2>(B2(), A());
  f3(1, 2);
  f4('t1', null);
  f5(fPositional, () {});
  f6((1,), (x: 2));
  f7(1, Future.value(2));
  f8(1, null);
  f9(D<int, String>(), D<num, Object>());
  f10(fPositional2, fPositional);
  f11(fNamed2, fNamed);
  f12((1, 's', b: false), (1 as num, 's' as Pattern, b: true));
  f13(E.e0, E2.e0);
  f14(ET2(ET(1)), ET(2));
}
