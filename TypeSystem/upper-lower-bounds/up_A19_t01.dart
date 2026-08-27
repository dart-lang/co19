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
/// @description Check that UP(`X1 extends B1`, `T2`) = `T2` if `X1 != T2`, none
/// of `X1` and `T2` is TOP, BOTTOM, NULL, OBJECT, `T?` or an intersection type
/// and `X1 <: T2`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X1 extends num>(X1 x1, num t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends num, num) = num
  v.expectStaticType<Exactly<num>>();
}

void f2<X1 extends int>(X1 x1, num t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends int, num) = num
  v.expectStaticType<Exactly<num>>();
}

void f3<X1 extends C>(X1 x1, C t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends C, C) = C
  v.expectStaticType<Exactly<C>>();
}

void f4<X1 extends D<int, String>>(X1 x1, D<num, Object> t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends D<int, String>, D<num, Object>) = D<num, Object>
  v.expectStaticType<Exactly<D<num, Object>>>();
}

void f5<X1 extends Function>(X1 x1, Function t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Function, Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f6<X1 extends FPositional>(X1 x1, Function t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FPositional, Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f7<X1 extends FPositional2>(X1 x1, FPositional t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FPositional2, FPositional) = FPositional
  v.expectStaticType<Exactly<FPositional>>();
}

void f8<X1 extends FNamed>(X1 x1, Function t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FNamed, Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f9<X1 extends FNamed2>(X1 x1, FNamed t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FNamed2, FNamed) = FNamed
  v.expectStaticType<Exactly<FNamed>>();
}

void f10<X1 extends Rec>(X1 x1, Record t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Rec, Record) = Record
  v.expectStaticType<Exactly<Record>>();
}

void f11<X1 extends Rec2>(X1 x1, Rec t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends Rec2, Rec) = Rec
  v.expectStaticType<Exactly<Rec>>();
}

void f12<X1 extends E>(X1 x1, Enum t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends E, Enum) = Enum
  v.expectStaticType<Exactly<Enum>>();
}

void f13<X1 extends ET2>(X1 x1, ET t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends ET2, ET) = ET
  v.expectStaticType<Exactly<ET>>();
}

void f14<X1 extends FutureOr<int>>(X1 x1, FutureOr<num> t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FutureOr<int>, FutureOr<num>) = FutureOr<num>
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f15<X1 extends FutureOr<int?>>(X1 x1, FutureOr<num?> t2) {
  var v = (1 > 2) ? x1 : t2; // UP(X1 extends FutureOr<int?>, FutureOr<num?>) = FutureOr<num?>
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(C(), C());
  f4(D<int, String>(), D<num, Object>());
  f5(() {}, () {});
  f6(fPositional, () {});
  f7(fPositional2, fPositional);
  f8(fNamed, () {});
  f9(fNamed2, fNamed);
  f10((1, 's', b: true), (1,));
  f11((1, 's', b: true), (1, 's', b: true));
  f12(E.e0, E2.e0);
  f13(ET2(ET(0)), ET(0));
  f14(1, 1);
  f15(1, 1);
}
