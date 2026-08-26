// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1?`, `T2?`) = `S?` where `S` is UP(`T1`, `T2`)
///
/// @description Check that UP(`T1?`, `T2?`) = `S?` where `S` is UP(`T1`, `T2`)
/// if the operands are not the same type and none of them is TOP, BOTTOM, NULL,
/// OBJECT, or an intersection type. Test that if `T1 <: T2` or `T2 <: T1` then
/// `S` is the corresponding supertype.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

class A {}
class B extends A {}

void f1(int? t1, num? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int?, num?) = UP(int, num)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f2(num? t1, int? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num?, int?) = UP(num, int)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f3<X extends num>(X? t1, num? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(X?, num?) = UP(X, num)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f4<X extends num>(num? t1, X? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num?, X?) = UP(num, X)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f5<X extends num, Y extends num>(X? t1, Y? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(X?, Y?) = UP(X, Y)? = num?
  v.expectStaticType<Exactly<num?>>();
}

void f6(FPositional2? t1, FPositional? t2) {
  // UP(FPositional2?, FPositional?) = UP(FPositional2, FPositional)? = FPositional?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FPositional?>>();
}

void f7(FPositional? t1, FPositional2? t2) {
  // UP(FPositional?, FPositional2?) = UP(FPositional, FPositional2)? = FPositional?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FPositional?>>();
}

void f8(FNamed2? t1, FNamed? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FNamed2?, FNamed?) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f9(FNamed? t1, FNamed2? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FNamed?, FNamed2?) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f10(FPositional? t1, Function? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FPositional?, Function?) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f11(Function? t1, FPositional? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function?, FPositional?) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f12(Rec2? t1, Rec? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Rec2?, Rec?) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f13(Rec? t1, Rec2? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Rec?, Rec2?) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f14(Rec? t1, Record? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Rec?, Record?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f15(Record? t1, Rec? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Record?, Rec?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f16(FutureOr<int>? t1, FutureOr<num>? t2) {
  // UP(FutureOr<int>?, FutureOr<num>?) = FutureOr<num>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>?>>();
}

void f17(FutureOr<num>? t1, FutureOr<int>? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FutureOr<num>?, FutureOr<int>?) = FutureOr<num>?
  v.expectStaticType<Exactly<FutureOr<num>?>>();
}

void f18(B? t1, A? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(B?, A?) = A?
  v.expectStaticType<Exactly<A?>>();
}

void f19(A? t1, B? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(A?, B?) = A?
  v.expectStaticType<Exactly<A?>>();
}

void f20(D<int, String>? t1, D<num, Object>? t2) {
  // UP(D<int, String>?, D<num, Object>?) = D<num, Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num, Object>?>>();
}

void f21(D<num, Object>? t1, D<int, String>? t2) {
  // UP(D<num, Object>?, D<int, String>?) = D<num, Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<num, Object>?>>();
}

void f22(E? t1, Enum? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(E?, Enum?) = Enum?
  v.expectStaticType<Exactly<Enum?>>();
}

void f23(Enum? t1, E? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Enum?, E?) = Enum?
  v.expectStaticType<Exactly<Enum?>>();
}

void f24(ET2? t1, ET? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET2?, ET?) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f25(ET? t1, ET2? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET?, ET2?) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f26(List<int>? t1, List<num>? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(List<int>?, List<num>?) = List<num>?
  v.expectStaticType<Exactly<List<num>?>>();
}

void f27(List<num>? t1, List<int>? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(List<num>?, List<int>?) = List<num>?
  v.expectStaticType<Exactly<List<num>?>>();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(1, 1);
  f4(1, 1);
  f5(1, 1);
  f6(fPositional2, fPositional);
  f7(fPositional, fPositional2);
  f8(fNamed2, fNamed);
  f9(fNamed, fNamed2);
  f10(fPositional, () {});
  f11(() {}, fPositional);
  f12((1, 's', b: true), (1, 's', b: true));
  f13((1, 's', b: true), (1, 's', b: true));
  f14((1, 's', b: true), (1,));
  f15((1,), (1, 's', b: true));
  f16(1, 1);
  f17(1, 1);
  f18(B(), A());
  f19(A(), B());
  f20(D<int, String>(), D<num, Object>());
  f21(D<num, Object>(), D<int, String>());
  f22(E.e0, E2.e0);
  f23(E2.e0, E.e0);
  f24(ET2(ET(0)), ET(0));
  f25(ET(0), ET2(ET(0)));
}
