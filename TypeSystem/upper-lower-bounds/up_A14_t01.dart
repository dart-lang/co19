// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T1`) =
///   - `T1` if `T2` is non-nullable
///   - `T1?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T1`), not
/// OBJECT(`T2`) and `T2` is non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @author sgrekhov22@gmail.com

// ignore_for_file: unused_local_variable

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(Object o, num n) {
  var v = (1 > 2) ? o : n; // UP(Object, num) = Object
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  v.expectStaticType<Exactly<Object>>(); // Check that `v` is not `Object?`
  v = confirmObjectContext(); // Check that `v` is not `FutureOr<Object>`
}

void f2(FutureOr<Object> o, num n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, num) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f3<X extends num>(Object o, X n) {
  var v = (1 > 2) ? o : n; // UP(Object, X) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f4<X extends num>(FutureOr<Object> o, X n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, X) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f5(Object o, Function n) {
  var v = (1 > 2) ? o : n; // UP(Object, Function) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f6(FutureOr<Object> o, Function n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Function) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f7(Object o, Record n) {
  var v = (1 > 2) ? o : n; // UP(Object, Record) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f8(FutureOr<Object> o, Record n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Record) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f9(Object o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n; // UP(Object, FutureOr<int>) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f10(FutureOr<Object> o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FutureOr<int>) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f11(Object o, C n) {
  var v = (1 > 2) ? o : n; // UP(Object, C) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f12(FutureOr<Object> o, C n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, C) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f13(Object o, D<int, String> n) {
  var v = (1 > 2) ? o : n; // UP(Object, D<int, String>) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f14(FutureOr<Object> o, D<int, String> n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, D<int, String>) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f15(Object o, FPositional n) {
  var v = (1 > 2) ? o : n; // UP(Object, FPositional) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f16(FutureOr<Object> o, FPositional n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FPositional) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f17(Object o, FNamed n) {
  var v = (1 > 2) ? o : n; // UP(Object, FNamed) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f18(FutureOr<Object> o, FNamed n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FNamed) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f19(Object o, Rec n) {
  var v = (1 > 2) ? o : n; // UP(Object, Rec) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f20(FutureOr<Object> o, Rec n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Rec) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f21(Object o, E n) {
  var v = (1 > 2) ? o : n; // UP(Object, E) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f22(FutureOr<Object> o, E n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, E) = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(1, 1);
  f4(1, 1);
  f5(1, () {});
  f6(1, () {});
  f7(1, (1,));
  f8(1, (1,));
  f9(1, 1);
  f10(1, 1);
  f11(1, C());
  f12(1, C());
  f13(1, D<int, String>());
  f14(1, D<int, String>());
  f15(1, <X extends num>(X x, [int i = 0]) => 0);
  f16(1, <X extends num>(X x, [int i = 0]) => 0);
  f17(1, <X extends num>(X x, {int i = 0}) => 0);
  f18(1, <X extends num>(X x, {int i = 0}) => 0);
  f19(1, (1, 'two', b: true));
  f20(1, (1, 'two', b: true));
  f21(1, E.e0);
  f22(1, E.e0);
}
