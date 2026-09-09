// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where NULL(`T2`) =
///   - `T1` if `T1` is nullable
///   - `T1?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1` if `T1 != T2`, `T1` and `T2`
/// are both not a TOP, BOTTOM or intersection type, if NULL(`T2`), not
/// NULL(`T1`) and `T1` is nullable.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(num? n) {
  var v = (1 > 2) ? n : null; // UP(num?, Null) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f1b(num? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(num?, Never?) = num?
  v.expectStaticType<Exactly<num?>>();
}

void f2a<X extends num>(X? n) {
  var v = (1 > 2) ? n : null; // UP(X?, Null) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f2b<X extends num>(X? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(X?, Never?) = X?
  v.expectStaticType<Exactly<X?>>();
}

void f3a(Function? n) {
  var v = (1 > 2) ? n : null; // UP(Function?, Null) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f3b(Function? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(Function?, Never?) = Function?
  v.expectStaticType<Exactly<Function?>>();
}

void f4a(Record? n) {
  var v = (1 > 2) ? n : null; // UP(Record?, Null) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f4b(Record? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(Record?, Never?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f5a(FutureOr<int>? n) {
  var v = (1 > 2) ? n : null; // UP(FutureOr<int>?, Null) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f5b(FutureOr<int>? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FutureOr<int>?, Never?) = FutureOr<int>?
  v.expectStaticType<Exactly<FutureOr<int>?>>();
}

void f6a(C? n) {
  var v = (1 > 2) ? n : null; // UP(C?, Null) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f6b(C? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(C?, Never?) = C?
  v.expectStaticType<Exactly<C?>>();
}

void f7a(D<int, String>? n) {
  var v = (1 > 2) ? n : null; // UP(D<int, String>?, Null) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f7b(D<int, String>? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(D<int, String>?, Never?) = D<int, String>?
  v.expectStaticType<Exactly<D<int, String>?>>();
}

void f8a(FPositional? n) {
  var v = (1 > 2) ? n : null; // UP(FPositional?, Null) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f8b(FPositional? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FPositional?, Never?) = FPositional?
  v.expectStaticType<Exactly<FPositional?>>();
}

void f9a(FNamed? n) {
  var v = (1 > 2) ? n : null; // UP(FNamed?, Null) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f9b(FNamed? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FNamed?, Never?) = FNamed?
  v.expectStaticType<Exactly<FNamed?>>();
}

void f10a(Rec? n) {
  var v = (1 > 2) ? n : null; // UP(Rec?, Null) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f10b(Rec? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(Rec?, Never?) = Rec?
  v.expectStaticType<Exactly<Rec?>>();
}

void f11a(E? n) {
  var v = (1 > 2) ? n : null; // UP(E?, Null) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f11b(E? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(E?, Never?) = E?
  v.expectStaticType<Exactly<E?>>();
}

void f12a(ET? n) {
  var v = (1 > 2) ? n : null; // UP(ET?, Null) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f12b(ET? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(ET?, Never?) = ET?
  v.expectStaticType<Exactly<ET?>>();
}

void f13a(FutureOr<Null> n) {
  // UP(FutureOr<Null>, Null) = FutureOr<Null>, because FutureOr<Null> is nullable
  var v = (1 > 2) ? n : null;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void f13b(FutureOr<Null> n, Never? t2) {
  // UP(FutureOr<Null>, Never?) = FutureOr<Null>, because FutureOr<Null> is nullable
  var v = (1 > 2) ? n : t2;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void f14a(FutureOr<Never>? n) {
  var v = (1 > 2) ? n : null; // UP(FutureOr<Never>?, Null) = FutureOr<Never>?
  v.expectStaticType<Exactly<FutureOr<Never>?>>();
}

void f14b(FutureOr<Never>? n, Never? t2) {
  var v = (1 > 2) ? n : t2; // UP(FutureOr<Never>?, Never?) = FutureOr<Never>?
  v.expectStaticType<Exactly<FutureOr<Never>?>>();
}

void main() {
  f1a(1);
  f1b(1, null);
  f2a(1);
  f2b(1, null);
  f3a(() {});
  f3b(() {}, null);
  f4a((1,));
  f4b((1,), null);
  f5a(1);
  f5b(1, null);
  f6a(C());
  f6b(C(), null);
  f7a(D<int, String>());
  f7b(D<int, String>(), null);
  f8a(<X extends num>(X x, [int i = 0]) => 0);
  f8b(<X extends num>(X x, [int i = 0]) => 0, null);
  f9a(<X extends num>(X x, {int i = 0}) => 0);
  f9b(<X extends num>(X x, {int i = 0}) => 0, null);
  f10a((1, 'two', b: true));
  f10b((1, 'two', b: true), null);
  f11a(E.e0);
  f11b(E.e0, null);
  f12a(ET(0));
  f12b(ET(0), null);
  f13a(null);
  f13b(null, null);
  f14a(null);
  f14b(null, null);
}
