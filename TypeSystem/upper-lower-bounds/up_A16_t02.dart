// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1?`, `T2?`) = `S?` where `S` is UP(`T1`, `T2`)
///
/// @description Check that UP(`T1?`, `T2?`) = `S?` where `S` is UP(`T1`, `T2`)
/// if `T1? != T2?` if the operands are not the same type and none of them is
/// TOP, BOTTOM, NULL, OBJECT, or an intersection type. Test that if `T1` and
/// `T2` are not subtypes of each other then `S` is the least upper bound of
/// `T1` and `T2`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(int? t1, String? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int?, String?) = UP(int, String)? = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f2(String? t1, int? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(String?, int?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f3(C? t1, String? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C?, String?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f4(String? t1, C? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(String?, C?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f5(C? t1, D? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(A?, B?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f6(D? t1, C? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(B?, A?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f7(Function? t1, Record? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function?, Record?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f8(Record? t1, Function? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Record?, Function?) = Object?
  v.expectStaticType<Exactly<Object?>>();
}

void f9(List<int>? t1, List<String>? t2) {
  // UP(List<int>?, List<String>?) = List<Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<List<Object>?>>();
}

void f10(List<String>? t1, List<int>? t2) {
  var v = (1 > 2) ? t1 : t2; // UP(List<String>?, List<int>?) = List<Object>?
  v.expectStaticType<Exactly<List<Object>?>>();
}

void f11(D<int, String>? t1, D<String, int>? t2) {
  // UP(D<int, String>?, D<String, int>?) = D<Object, Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<Object, Object>?>>();
}

void f12(D<String, int>? t1, D<int, String>? t2) {
  // UP(D<String, int>?, D<int, String>?) = D<Object, Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<D<Object, Object>?>>();
}

void f13((int,)? t1, (String,)? t2) {
  var v = (1 > 2) ? t1 : t2; // UP((int,)?, (String,)?) = (Object,)?
  v.expectStaticType<Exactly<(Object,)?>>();
}

void f14((String,)? t1, (int,)? t2) {
  var v = (1 > 2) ? t1 : t2; // UP((String,)?, (int,)?) = (Object,)?
  v.expectStaticType<Exactly<(Object,)?>>();
}

void f15((int,)? t1, (int, String)? t2) {
  var v = (1 > 2) ? t1 : t2; // UP((int,)?, (int, String)?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f16((int, String)? t1, (int,)? t2) {
  var v = (1 > 2) ? t1 : t2; // UP((int, String)?, (int,)?) = Record?
  v.expectStaticType<Exactly<Record?>>();
}

void f17(int Function()? t1, String Function()? t2) {
  // UP(int Function()?, String Function()?) = Object Function()?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object Function()?>>();
}

void f18(String Function()? t1, int Function()? t2) {
  // UP(String Function()?, int Function()?) = Object Function()?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object Function()?>>();
}

void f19(int Function(int)? t1, int Function()? t2) {
  // UP(int Function(int)?, int Function()?) = Function?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function?>>();
}

void f20(int Function()? t1, int Function(int)? t2) {
  // UP(int Function()?, int Function(int)?) = Function?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function?>>();
}

void f21(FutureOr<int>? t1, String? t2) {
  // UP(FutureOr<int>?, String?) = FutureOr<Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
}

void f22(String? t1, FutureOr<int>? t2) {
  // UP(String?, FutureOr<int>?) = FutureOr<Object>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>?>>();
}

void f23(FutureOr<int>? t1, num? t2) {
  // UP(FutureOr<int>?, num?) = FutureOr<num>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>?>>();
}

void f24(num? t1, FutureOr<int>? t2) {
  // UP(num?, FutureOr<int>?) = FutureOr<num>?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>?>>();
}

void main() {
  f1(1, 's');
  f2('s', 1);
  f3(C(), 's');
  f4('s', C());
  f5(C(), D());
  f6(D(), C());
  f7(() {}, (1,));
  f8((1,), () {});
  f9([1], ['s']);
  f10(['s'], [1]);
  f11(D<int, String>(), D<String, int>());
  f12(D<String, int>(), D<int, String>());
  f13((1,), ('s',));
  f14(('s',), (1,));
  f15((1,), (1, 's'));
  f16((1, 's'), (1,));
  f17(() => 1, () => 's');
  f18(() => 's', () => 1);
  f19((int i) => i, () => 1);
  f20(() => 1, (int i) => i);
  f21(1, 's');
  f22('s', 1);
  f23(1, 1);
  f24(1, 1);
}
