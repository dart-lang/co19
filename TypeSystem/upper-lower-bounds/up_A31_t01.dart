// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`(...)`, `(...)`) = `Record` otherwise
///
/// @description Check that UP(`(...)`, `(...)`) = `Record` if the records do
/// not have the same shape (different number of positional fields, different
/// names of named fields, etc.).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(() t1, (dynamic,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f2((void,) t1, (void, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f3((Object?, String) t1, (Object?, String, bool) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f4((Never,) t1, ({int i}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f5(({dynamic i}) t1, ({dynamic j}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f6(({void i}) t1, ({void i, String s}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f7((Function, {String s}) t1, (Function, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f8((E, {String s}) t1, ({E i, String s}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f9((ET, {String a}) t1, (ET, {String b}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f10((Null, {String s}) t1, (Null, {String s, bool b}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f11(Rec t1, (int, String) t2) {
  var v = (1 > 2) ? t1 : t2; // Rec = (int, String, {bool b})
  v.expectStaticType<Exactly<Record>>();
}

void f12((Object?, (String,)) t1, (Object?,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f13<X extends num>((X,) t1, (X, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f14((Never, {int i}) t1, ({int i}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f15((Function,) t1, (Function, int) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f16((E,) t1, (E, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f17((ET,) t1, ({ET x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f18((Null,) t1, () t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f19((FutureOr<int>,) t1, (FutureOr<int>, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f20((void, {Function x}) t1, (void, {E y}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f21((dynamic, {ET x}) t1, (dynamic, {ET y}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void main() {
  f1((), (1,));
  f2((1,), (1, 's'));
  f3((1, 's'), (1, 's', true));
  print(f4);
  f5((i: 1), (j: 1));
  f6((i: 1), (i: 1, s: 's'));
  f7((() {}, s: 's'), (() {}, 's'));
  f8((E.e0, s: 's'), (i: E.e0, s: 's'));
  f9((ET(0), a: 's'), (ET(0), b: 's'));
  f10((null, s: 's'), (null, s: 's', b: true));
  f11((1, 's', b: true), (1, 's'));
  f12((1, ('s',)), (1,));
  f13<int>((1,), (1, 's'));
  print(f14);
  f15((() {},), (() {}, 1));
  f16((E.e0,), (E.e0, 's'));
  f17((ET(0),), (x: ET(0)));
  f18((null,), ());
  f19((1,), (1, 's'));
  f20((1, x: () {}), (1, y: E.e0));
  f21((1, x: ET(0)), (1, y: ET(0)));
}
