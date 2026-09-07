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
/// @description Check that UP(`X1 extends B1`, `T2`) = UP(`B1a`, `T2`) where
/// `B1a` is the greatest closure of `B1` with respect to `X1`if `X1 != T2`,
/// none of `X1` and `T2` is TOP, BOTTOM, NULL, OBJECT, `T?` or an intersection
/// type and `X1 <: T2` and `T2 <: X1` are both false.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X1 extends num>(X1 x1, String t2) {
  // B1a = num; UP(num, String) = Object.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<Object>>();
}

void f2<X1 extends C>(X1 x1, String t2) {
  // B1a = C; UP(C, String) = Object.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<Object>>();
}

void f3<X1 extends D<int, String>>(X1 x1, D<String, int> t2) {
  // B1a = D<int, String>; UP(D<int, String>, D<String, int>) = D<Object, Object>.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<D<Object, Object>>>();
}

void f4<X1 extends List<int>>(X1 x1, List<String> t2) {
  // B1a = List<int>; UP(List<int>, List<String>) = List<Object>.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<List<Object>>>();
}

void f5<X1 extends (int,)>(X1 x1, (String,) t2) {
  // B1a = (int,); UP((int,), (String,)) = (Object,).
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<(Object,)>>();
}

void f6<X1 extends (int,)>(X1 x1, (int, String) t2) {
  // B1a = (int,); UP((int,), (int, String)) = Record.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f7<X1 extends int Function()>(X1 x1, String Function() t2) {
  // B1a = int Function(); UP(int Function(), String Function()) = Object Function().
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<Object Function()>>();
}

void f8<X1 extends int Function(int)>(X1 x1, int Function() t2) {
  // B1a = int Function(int); UP(int Function(int), int Function()) = Function.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void f9<X1 extends FutureOr<int>>(X1 x1, String t2) {
  // B1a = FutureOr<int>; UP(FutureOr<int>, String) = FutureOr<Object>.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
}

void f10<X1 extends FutureOr<int>>(X1 x1, num t2) {
  // B1a = FutureOr<int>; UP(FutureOr<int>, num) = FutureOr<num>.
  var v = (1 > 2) ? x1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f11<X extends num, Y extends num>(X x, Y y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<num>>();
}

void main() {
  f1(1, 's');
  f2(C(), 's');
  f3(D<int, String>(), D<String, int>());
  f4([1], ['s']);
  f5((1,), ('s',));
  f6((1,), (1, 's'));
  f7(() => 1, () => 's');
  f8((int i) => i, () => 1);
  f9(1, 's');
  f10(1, 1);
  f11(1, 2);
  f11<num, int>(1, 2);
}
