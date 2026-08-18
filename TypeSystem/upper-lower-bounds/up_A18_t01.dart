// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2?`) = `S?` where `S` is UP(`T1`, `T2`)
///
/// @description Check that UP(`T1`, `T2?`) = `S?` where `S` is UP(`T1`, `T2`)
/// if the operands are not the same type and none of them is TOP, BOTTOM, NULL,
/// OBJECT, or an intersection type. Test that if `T1 <: T2` or `T2 <: T1` then
/// `S` is the corresponding supertype.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

class A {}
class B extends A {}

void f1(int t1, num? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int, num?) = UP(int, num)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f2(num t1, int? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, int?) = UP(num, int)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f3<X extends num>(X t1, num? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(X, num?) = UP(X, num)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f4<X extends num>(num t1, X? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, X?) = UP(num, X)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f5(FPositional2 t1, FPositional? t2) {
  // UP(FPositional2, FPositional?) = UP(FPositional2, FPositional)? = FPositional?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FPositional?>>();
}

void f6(FPositional t1, FPositional2? t2) {
  // UP(FPositional, FPositional2?) = UP(FPositional, FPositional2)? = FPositional?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FPositional?>>();
}

void f7(FNamed2 t1, FNamed? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FNamed2, FNamed?) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f8(FNamed t1, FNamed2? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FNamed, FNamed2?) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f9(FPositional t1, Function? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FPositional, Function?) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f10(Function t1, FPositional? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, FPositional?) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f11(Rec2 t1, Rec? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Rec2, Rec?) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f12(Rec t1, Rec2? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Rec, Rec2?) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f13(Rec t1, Record? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Rec, Record?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f14(Record t1, Rec? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Record, Rec?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f15(FutureOr<int> t1, FutureOr<num>? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FutureOr<int>, FutureOr<num>?) = FutureOr<num>?
  v.expectStaticType<Exactly<FutureOr<num>?>>();
}

void f16(FutureOr<num> t1, FutureOr<int>? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FutureOr<num>, FutureOr<int>?) = FutureOr<num>?
  v.expectStaticType<Exactly<FutureOr<num>?>>();
}

void f17(B t1, A? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(B, A?) = A?
  v.expectStaticType<Exactly<A?>>();
}

void f18(A t1, B? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(A, B?) = A?
  v.expectStaticType<Exactly<A?>>();
}

void f19(D<int, String> t1, D<num, Object>? t2) {
  // UP(D<int, String>, D<num, Object>?) = D<num, Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num, Object>?>>();
}

void f20(D<num, Object> t1, D<int, String>? t2) {
  // UP(D<num, Object>, D<int, String>?) = D<num, Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num, Object>?>>();
}

void f21(E t1, Enum? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(E, Enum?) = Enum?
  v.expectStaticType<Exactly<Enum?>>();
}

void f22(Enum t1, E? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Enum, E?) = Enum?
  v.expectStaticType<Exactly<Enum?>>();
}

void f23(ET2 t1, ET? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET2, ET?) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f24(ET t1, ET2? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET, ET2?) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(1, 1);
  f4(1, 1);
  f5(fPositional2, fPositional);
  f6(fPositional, fPositional2);
  f7(fNamed2, fNamed);
  f8(fNamed, fNamed2);
  f9(fPositional, () {});
  f10(() {}, fPositional);
  f11((1, 's', b: true), (1, 's', b: true));
  f12((1, 's', b: true), (1, 's', b: true));
  f13((1, 's', b: true), (1,));
  f14((1,), (1, 's', b: true));
  f15(1, 1);
  f16(1, 1);
  f17(B(), A());
  f18(A(), B());
  f19(D<int, String>(), D<num, Object>());
  f20(D<num, Object>(), D<int, String>());
  f21(E.e0, E2.e0);
  f22(E2.e0, E.e0);
  f23(ET2(ET(0)), ET(0));
  f24(ET(0), ET2(ET(0)));
}
