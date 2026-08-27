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
/// @description Check that UP(`T1`, `X2 extends B2`) = `T1` if `T1 != X2`, none
/// of `T1` and `X2` is TOP, BOTTOM, NULL, OBJECT, `T?` or an intersection type,
/// `T1 <: X2` does not hold, and `X2 <: T1`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X2 extends num>(num t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(num, X2 extends num) = num
  v.expectStaticType<Exactly<num>>();
}

void f2<X2 extends int>(num t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(num, X2 extends int) = num
  v.expectStaticType<Exactly<num>>();
}

void f3<X2 extends C>(C t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(C, X2 extends C) = C
  v.expectStaticType<Exactly<C>>();
}

void f4<X2 extends D<int, String>>(D<num, Object> t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(D<num, Object>, X2 extends D<int, String>) = D<num, Object>
  v.expectStaticType<Exactly<D<num, Object>>>();
}

void f5<X2 extends Function>(Function t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(Function, X2 extends Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f6<X2 extends FPositional>(Function t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(Function, X2 extends FPositional) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f7<X2 extends FPositional2>(FPositional t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(FPositional, X2 extends FPositional2) = FPositional
  v.expectStaticType<Exactly<FPositional>>();
}

void f8<X2 extends FNamed>(Function t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(Function, X2 extends FNamed) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f9<X2 extends FNamed2>(FNamed t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(FNamed, X2 extends FNamed2) = FNamed
  v.expectStaticType<Exactly<FNamed>>();
}

void f10<X2 extends Rec>(Record t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(Record, X2 extends Rec) = Record
  v.expectStaticType<Exactly<Record>>();
}

void f11<X2 extends Rec2>(Rec t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(Rec, X2 extends Rec2) = Rec
  v.expectStaticType<Exactly<Rec>>();
}

void f12<X2 extends E>(Enum t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(Enum, X2 extends E) = Enum
  v.expectStaticType<Exactly<Enum>>();
}

void f13<X2 extends ET2>(ET t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(ET, X2 extends ET2) = ET
  v.expectStaticType<Exactly<ET>>();
}

void f14<X2 extends FutureOr<int>>(FutureOr<num> t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(FutureOr<num>, X2 extends FutureOr<int>) = FutureOr<num>
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f15<X2 extends FutureOr<int?>>(FutureOr<num?> t1, X2 x2) {
  var v = (1 > 2) ? t1 : x2; // UP(FutureOr<num?>, X2 extends FutureOr<int?>) = FutureOr<num?>
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(C(), C());
  f4(D<num, Object>(), D<int, String>());
  f5(() {}, () {});
  f6(() {}, fPositional);
  f7(fPositional, fPositional2);
  f8(() {}, fNamed);
  f9(fNamed, fNamed2);
  f10((1,), (1, 's', b: true));
  f11((1, 's', b: true), (1, 's', b: true));
  f12(E2.e0, E.e0);
  f13(ET(0), ET2(ET(0)));
  f14(1, 1);
  f15(1, 1);
}
