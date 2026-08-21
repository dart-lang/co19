// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T2`) =
///   - `T2` if `T1` is non-nullable
///   - `T2?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T2?` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T2`), not
/// OBJECT(`T1`) and `T1` is not non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(num? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(num?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>(); // Check that v is not `Object`
  // `Object` and `FutureOr<Object> `are subtypes of each other, which means
  // that we can't see the difference using `expectStaticType()` function.
  // `v.expectStaticType<Exactly<FutureOr<Object?>>>();` also succeeds. Let's
  // check that `v` is not `FutureOr<Object?>`
  v = confirmObjectContext();
}

void f2(num? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(num?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f3<X extends num>(X? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(X?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f4<X extends num>(X? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(X?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f5(Function? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Function?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f6(Function? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Function?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f7(Record? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Record?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f8(Record? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Record?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f9(FutureOr<int>? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FutureOr<int>?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f10(FutureOr<int>? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FutureOr<int>?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f11(C? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(C?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f12(C? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(C?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f13(D<int, String>? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(D<int, String>?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f14(D<int, String>? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(D<int, String>?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f15(FPositional? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FPositional?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f16(FPositional? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FPositional?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f17(FNamed? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FNamed?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f18(FNamed? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FNamed?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f19(Rec? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Rec?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f20(Rec? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Rec?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f21(E? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(E?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f22(E? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(E?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f23(ET? n, Object o) {
  var v = (1 > 2) ? n : o; // UP(ET?, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f24(ET? n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(ET?, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void f25(ET n, Object o) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? n : o; // UP(ET, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = confirmObjectContext();
}

void f26(ET n, FutureOr<Object> o) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? n : o; // UP(ET, FutureOr<Object>) = FutureOr<Object>?
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
  v = confirmFutureOrObjectContext();
}

void main() {
  f1(1, 1);
  f2(1, 1);
  f3(1, 1);
  f4(1, 1);
  f5(() {}, 1);
  f6(() {}, 1);
  f7((1,), 1);
  f8((1,), 1);
  f9(1, 1);
  f10(1, 1);
  f11(C(), 1);
  f12(C(), 1);
  f13(D<int, String>(), 1);
  f14(D<int, String>(), 1);
  f15(<X extends num>(X x, [int i = 0]) => 0, 1);
  f16(<X extends num>(X x, [int i = 0]) => 0, 1);
  f17(<X extends num>(X x, {int i = 0}) => 0, 1);
  f18(<X extends num>(X x, {int i = 0}) => 0, 1);
  f19((1, 'two', b: true), 1);
  f20((1, 'two', b: true), 1);
  f21(E.e0, 1);
  f22(E.e0, 1);
  f23(ET(0), 1);
  f24(ET(0), 1);
  f25(ET(0), 1);
  f26(ET(0), 1);
}
