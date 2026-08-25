// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where NULL(`T1`) =
///   - `T2` if `T2` is nullable
///   - `T2?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T2?` if `T1 != T2`, `T1` and `T2`
/// are both not a TOP, BOTTOM or intersection type, if NULL(`T1`), not
/// NULL(`T2`) and `T2` is not nullable.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(num n) {
  var v = (1 > 2) ? null : n; // UP(Null, num) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f2(Never? t1, num n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, num) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f3<X extends num>(X n) {
  var v = (1 > 2) ? null : n; // UP(Null, X) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f4<X extends num>(Never? t1, X n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, X) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f5(Function n) {
  var v = (1 > 2) ? null : n; // UP(Null, Function) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f6(Never? t1, Function n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, Function) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f7(Record n) {
  var v = (1 > 2) ? null : n; // UP(Null, Record) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f8(Never? t1, Record n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, Record) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f9(FutureOr<int> n) {
  var v = (1 > 2) ? null : n; // UP(Null, FutureOr<int>) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f10(Never? t1, FutureOr<int> n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FutureOr<int>) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f11(C n) {
  var v = (1 > 2) ? null : n; // UP(Null, C) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f12(Never? t1, C n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, C) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f13(D<int, String> n) {
  var v = (1 > 2) ? null : n; // UP(Null, D<int, String>) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f14(Never? t1, D<int, String> n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, D<int, String>) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f15(FPositional n) {
  var v = (1 > 2) ? null : n; // UP(Null, FPositional) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f16(Never? t1, FPositional n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FPositional) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f17(FNamed n) {
  var v = (1 > 2) ? null : n; // UP(Null, FNamed) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f18(Never? t1, FNamed n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FNamed) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f19(Rec n) {
  var v = (1 > 2) ? null : n; // UP(Null, Rec) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f20(Never? t1, Rec n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, Rec) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f21(E n) {
  var v = (1 > 2) ? null : n; // UP(Null, E) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f22(Never? t1, E n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, E) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f23(ET n) {
  var v = (1 > 2) ? null : n; // UP(Null, ET) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f24(Never? t1, ET n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, ET) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void main() {
  f1(1);
  f2(null, 1);
  f3(1);
  f4(null, 1);
  f5(() {});
  f6(null, () {});
  f7((1,));
  f8(null, (1,));
  f9(1);
  f10(null, 1);
  f11(C());
  f12(null, C());
  f13(D<int, String>());
  f14(null, D<int, String>());
  f15(<X extends num>(X x, [int i = 0]) => 0);
  f16(null, <X extends num>(X x, [int i = 0]) => 0);
  f17(<X extends num>(X x, {int i = 0}) => 0);
  f18(null, <X extends num>(X x, {int i = 0}) => 0);
  f19((1, 'two', b: true));
  f20(null, (1, 'two', b: true));
  f21(E.e0);
  f22(null, E.e0);
  f23(ET(0));
  f24(null, ET(0));
}
