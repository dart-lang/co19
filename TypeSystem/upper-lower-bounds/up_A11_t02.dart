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

void f1a(num n) {
  var v = (1 > 2) ? null : n; // UP(Null, num) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f1b(Never? t1, num n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, num) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f2a<X extends num>(X n) {
  var v = (1 > 2) ? null : n; // UP(Null, X) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f2b<X extends num>(Never? t1, X n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, X) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f3a(Function n) {
  var v = (1 > 2) ? null : n; // UP(Null, Function) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f3b(Never? t1, Function n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, Function) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f4a(Record n) {
  var v = (1 > 2) ? null : n; // UP(Null, Record) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f4b(Never? t1, Record n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, Record) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f5a(FutureOr<int> n) {
  var v = (1 > 2) ? null : n; // UP(Null, FutureOr<int>) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f5b(Never? t1, FutureOr<int> n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FutureOr<int>) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f6a(C n) {
  var v = (1 > 2) ? null : n; // UP(Null, C) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f6b(Never? t1, C n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, C) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f7a(D<int, String> n) {
  var v = (1 > 2) ? null : n; // UP(Null, D<int, String>) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f7b(Never? t1, D<int, String> n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, D<int, String>) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f8a(FPositional n) {
  var v = (1 > 2) ? null : n; // UP(Null, FPositional) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f8b(Never? t1, FPositional n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FPositional) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f9a(FNamed n) {
  var v = (1 > 2) ? null : n; // UP(Null, FNamed) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f9b(Never? t1, FNamed n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FNamed) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f10a(Rec n) {
  var v = (1 > 2) ? null : n; // UP(Null, Rec) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f10b(Never? t1, Rec n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, Rec) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f11a(E n) {
  var v = (1 > 2) ? null : n; // UP(Null, E) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f11b(Never? t1, E n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, E) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f12a(ET n) {
  var v = (1 > 2) ? null : n; // UP(Null, ET) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f12b(Never? t1, ET n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, ET) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f13a(FutureOr<Never> n) {
  var v = (1 > 2) ? null : n; // UP(Null, FutureOr<Never>) = FutureOr<Never>?
  v.expectStaticType<Exactly<FutureOr<Never>?>>();
}

void f13b(Never? t1, FutureOr<Never> n) {
  var v = (1 > 2) ? t1 : n; // UP(Never?, FutureOr<Never>) = FutureOr<Never>?
  v.expectStaticType<Exactly<FutureOr<Never>?>>();
}

void main() {
  f1a(1);
  f1b(null, 1);
  f2a(1);
  f2b(null, 1);
  f3a(() {});
  f3b(null, () {});
  f4a((1,));
  f4b(null, (1,));
  f5a(1);
  f5b(null, 1);
  f6a(C());
  f6b(null, C());
  f7a(D<int, String>());
  f7b(null, D<int, String>());
  f8a(<X extends num>(X x, [int i = 0]) => 0);
  f8b(null, <X extends num>(X x, [int i = 0]) => 0);
  f9a(<X extends num>(X x, {int i = 0}) => 0);
  f9b(null, <X extends num>(X x, {int i = 0}) => 0);
  f10a((1, 'two', b: true));
  f10b(null, (1, 'two', b: true));
  f11a(E.e0);
  f11b(null, E.e0);
  f12a(ET(0));
  f12b(null, ET(0));
  print(f13a);
  print(f13b);
}
