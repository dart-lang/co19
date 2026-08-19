// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `X2 extends B2`) =
///   - `X2` if `T1 <: X2`
///   - otherwise `T1` if `X2 <: T1`
///   - otherwise UP(`T1`, `B2a`) where `B2a` is the greatest closure of `B2`
///     with respect to `X2`, as defined in inference.md.
///
/// @description Check that UP(`T1`, `X2 extends B2`) = UP(`T1`, `B2a`) where
/// `B2a` is the greatest closure of `B2` with respect to `X2` if `T1 != X2`,
/// none of `T1` and `X2` is TOP, BOTTOM, NULL, OBJECT, nullable or an
/// intersection type and `T1 <: X2` and `X2 <: T1` are both false.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X2 extends num>(String t1, X2 x2) {
  // B2a = num; UP(String, num) = Object.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<Object>>();
}

void f2<X2 extends C>(String t1, X2 x2) {
  // B2a = C; UP(String, C) = Object.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<Object>>();
}

void f3<X2 extends D<int, String>>(D<String, int> t1, X2 x2) {
  // B2a = D<int, String>; UP(D<String, int>, D<int, String>) = D<Object, Object>.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<D<Object, Object>>>();
}

void f4<X2 extends List<int>>(List<String> t1, X2 x2) {
  // B2a = List<int>; UP(List<String>, List<int>) = List<Object>.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<List<Object>>>();
}

void f5<X2 extends (int,)>((String,) t1, X2 x2) {
  // B2a = (int,); UP((String,), (int,)) = (Object,).
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<(Object,)>>();
}

void f6<X2 extends (int,)>((int, String) t1, X2 x2) {
  // B2a = (int,); UP((int, String), (int,)) = Record.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<Record>>();
}

void f7<X2 extends int Function()>(String Function() t1, X2 x2) {
  // B2a = int Function(); UP(String Function(), int Function()) = Object Function().
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<Object Function()>>();
}

void f8<X2 extends int Function(int)>(int Function() t1, X2 x2) {
  // B2a = int Function(int); UP(int Function(), int Function(int)) = Function.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<Function>>();
}

void f9<X2 extends FutureOr<int>>(String t1, X2 x2) {
  // B2a = FutureOr<int>; UP(String, FutureOr<int>) = FutureOr<Object>.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
}

void f10<X2 extends FutureOr<int>>(num t1, X2 x2) {
  // B2a = FutureOr<int>; UP(num, FutureOr<int>) = FutureOr<num>.
  var v = (1 > 2) ? t1 : x2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void main() {
  f1('s', 1);
  f2('s', C());
  f3(D<String, int>(), D<int, String>());
  f4(['s'], [1]);
  f5(('s',), (1,));
  f6((1, 's'), (1,));
  f7(() => 's', () => 1);
  f8(() => 1, (int i) => i);
  f9('s', 1);
  f10(1, 1);
}
