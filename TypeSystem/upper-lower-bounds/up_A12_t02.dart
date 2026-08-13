// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where NULL(`T2`) =
///   - `T1` if `T1` is nullable
///   - `T1*` if `Null <: T1` or `T2 <: Object` (that is, `T1` or `T2` is
///     legacy)
///   - `T1?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1?` if `T1 != T2`, `T1` and `T2`
/// are both not a TOP, BOTTOM or intersection types, NULL(`T2`) is `true`,
/// NULL(`T1`) is `false` and `T1` is not nullable.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(num n) {
  var v = (1 > 2) ? n : null; // UP(num, Null) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f2(num n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(num, Never?) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f3<X extends num>(X n) {
  var v = (1 > 2) ? n : null; // UP(X, Null) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f4<X extends num>(X n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(X, Never?) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f5(Function n) {
  var v = (1 > 2) ? n : null; // UP(Function, Null) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f6(Function n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(Function, Never?) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f7(Record n) {
  var v = (1 > 2) ? n : null; // UP(Record, Null) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f8(Record n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(Record, Never?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f9(FutureOr<int> n) {
  var v = (1 > 2) ? n : null; // UP(FutureOr<int>, Null) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f10(FutureOr<int> n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FutureOr<int>, Never?) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f11(C n) {
  var v = (1 > 2) ? n : null; // UP(C, Null) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f12(C n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(C, Never?) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f13(D<int, String> n) {
  var v = (1 > 2) ? n : null; // UP(D<int, String>, Null) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f14(D<int, String> n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(D<int, String>, Never?) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f15(FPositional n) {
  var v = (1 > 2) ? n : null; // UP(FPositional, Null) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f16(FPositional n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FPositional, Never?) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f17(FNamed n) {
  var v = (1 > 2) ? n : null; // UP(FNamed, Null) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f18(FNamed n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FNamed, Never?) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f19(Rec n) {
  var v = (1 > 2) ? n : null; // UP(Rec, Null) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f20(Rec n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(Rec, Never?) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f21(E n) {
  var v = (1 > 2) ? n : null; // UP(E, Null) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f22(E n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(E, Never?) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f23(ET n) {
  var v = (1 > 2) ? n : null; // UP(ET, Null) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f24(ET n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(ET, Never?) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void main() {
  f1(1);
  f2(1, null);
  f3(1);
  f4(1, null);
  f5(() {});
  f6(() {}, null);
  f7((1,));
  f8((1,), null);
  f9(1);
  f10(1, null);
  f11(C());
  f12(C(), null);
  f13(D<int, String>());
  f14(D<int, String>(), null);
  f15(<X extends num>(X x, [int i = 0]) => 0);
  f16(<X extends num>(X x, [int i = 0]) => 0, null);
  f17(<X extends num>(X x, {int i = 0}) => 0);
  f18(<X extends num>(X x, {int i = 0}) => 0, null);
  f19((1, 'two', b: true));
  f20((1, 'two', b: true), null);
  f21(E.e0);
  f22(E.e0, null);
  f23(ET(0));
  f24(ET(0), null);
}
