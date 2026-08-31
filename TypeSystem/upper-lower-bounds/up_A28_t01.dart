// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`(...)`, `Record`) = `Record`
///
/// @description Check that UP(`(...)`, `Record`) = `Record`.
/// Note that no earlier rule applies because record types and `Record` are
/// never TOP, OBJECT, NULL, BOTTOM, intersection types, types of the form `T?`,
/// type variables, function types, or `Function`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(() t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f2((int,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f3((dynamic, String) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f4((void, {String s}) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f5(({int i}) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f6(({Object? i, String s}) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f7(Rec t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f8((Object?, (String, bool)) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f9((num?, Object?) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f10<X extends num>((X, String) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f11((E,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f12((ET,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f13((FutureOr<int>,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f14((Never,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f15((Function,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f16((Null,) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void main() {
  f1((), (1,));
  f2((1,), (1,));
  f3((1, 'two'), (1,));
  f4((1, s: 'two'), (1,));
  f5((i: 1), (1,));
  f6((i: 1, s: 'two'), (1,));
  f7((1, 'two', b: true), (1,));
  f8((1, ('two', true)), (1,));
  f9((1, 'two'), (1,));
  f10<int>((1, 'two'), (1,));
  f11((E.e0,), (1,));
  f12((ET(0),), (1,));
  f13((1,), (1,));
  print(f14);
  f15((() {},), (1,));
  f16((null,), (1,));
}
