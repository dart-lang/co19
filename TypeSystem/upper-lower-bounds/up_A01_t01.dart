// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// - UP(`T`, `T`) = `T`
///
/// @description Check that UP(`T`, `T`) = `T`
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/expect.dart' show Expect;
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f2(Object x, Object y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<Object>>();
}

void f3(dynamic x, dynamic y) {
  var v = (1 > 2) ? x : y;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f4(void x, void y) {
  var v = (1 > 2) ? x : y;
  captureStaticType(v, <X>(X value) {
    Expect.equals(typeOf<void>(), typeOf<X>());
  });
}

void f5() {
  var v = (1 > 2) ? null : null;
  // For historical reasons type of `v` inferred as `dynamic`
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f6(Never x, Never y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<Never>>(); // ignore: dead_code
}

void f7(Function x, Function y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<Function>>();
}

void f8(Record x, Record y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<Record>>();
}

void f9(FutureOr<int> x, FutureOr<int> y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f10(String? x, String? y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<String?>>();
}

void f11(C x, C y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<C>>();
}

void f12(D<int, String> x, D<int, String> y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<D<int, String>>>();
}

void f13(FPositional x, FPositional y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<FPositional>>();
}

void f14(FNamed x, FNamed y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<FNamed>>();
}

void f15(Rec x, Rec y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<Rec>>();
}

void f16() {
  var v = (1 > 2) ? E.e0 : E.e0;
  v.expectStaticType<Exactly<E>>();
}

void f17(ET x, ET y) {
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<ET>>();
}

void main() {
  f2(1, 2);
  f3(1, 2);
  f4(1, 2);
  f5();
  print(f6);
  f7(() {}, () {});
  f8((1,), (1,));
  f9(1, 2);
  f10(null, 's');
  f11(C(), C());
  f12(D<int, String>(), D<int, String>());
  f13(
    <X extends num>(X x, [int i = 0]) => 0,
    <X extends num>(X x, [int i = 0]) => 0,
  );
  f14(
    <X extends num>(X x, {int i = 0}) => 0,
    <X extends num>(X x, {int i = 0}) => 0,
  );
  f15((1, 'two', b: true), (1, 'two', b: true));
  f16();
  f17(ET(1), ET(2));
}
