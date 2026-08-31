// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`Record`, `(...)`) = `Record`
///
/// @description Check that UP(`Record`, `(...)`) = `Record`.
/// Note that no earlier rule applies because record types and `Record` are
/// never TOP, OBJECT, NULL, BOTTOM, intersection types, types of the form `T?`,
/// type variables, function types, or `Function`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(Record t1, () t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f2(Record t1, (int,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f3(Record t1, (dynamic, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f4(Record t1, (void, {String s}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f5(Record t1, ({int i}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f6(Record t1, ({Object? i, String s}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f7(Record t1, Rec t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f8(Record t1, (Object?, (String, bool)) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f9(Record t1, (num?, Object?) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f10<X extends num>(Record t1, (X, String) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f11(Record t1, (E,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f12(Record t1, (ET,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f13(Record t1, (FutureOr<int>,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f14(Record t1, (Never,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f15(Record t1, (Function,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void f16(Record t1, (Null,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Record>>();
}

void main() {
  f1((1,), ());
  f2((1,), (1,));
  f3((1,), (1, 'two'));
  f4((1,), (1, s: 'two'));
  f5((1,), (i: 1));
  f6((1,), (i: 1, s: 'two'));
  f7((1,), (1, 'two', b: true));
  f8((1,), (1, ('two', true)));
  f9((1,), (1, 'two'));
  f10<int>((1,), (1, 'two'));
  f11((1,), (E.e0,));
  f12((1,), (ET(0),));
  f13((1,), (1,));
  print(f14);
  f15((1,), (() {},));
  f16((1,), (null,));
}
