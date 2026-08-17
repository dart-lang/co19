// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if BOTTOM(`T2`)
///
/// @description Check that UP(`T1`, `T2`) = `T1` if BOTTOM(`T2`), `T1 != T2`
/// and not TOP(`T1`) nor TOP(`T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1<X extends num>(X n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<X>>();
}

void f2<X extends Never, Y extends num>(Y n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Y>>();
}

void f3(Object n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Object>>();
}

void f4<X extends Never>(Object n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Object>>();
}

void f7(Never n1) {
  var v = (1 > 2) ? null : n1;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f8<X extends Never>(X n1) {
  var v = (1 > 2) ? null : n1;
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f9(Function n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Function>>();
}

void f10<X extends Never>(Function n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Function>>();
}

void f11(Record n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Record>>();
}

void f12<X extends Never>(Record n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Record>>();
}

void f13(FutureOr<int> n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f14<X extends Never>(FutureOr<int> n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f15(String? n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<String?>>();
}

void f16<X extends Never>(String? n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<String?>>();
}

void f17(C n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<C>>();
}

void f18<X extends Never>(C n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<C>>();
}

void f19(D<int, String> n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<D<int, String>>>();
}

void f20<X extends Never>(D<int, String> n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<D<int, String>>>();
}

void f21(FPositional n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<FPositional>>();
}

void f22<X extends Never>(FPositional n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<FPositional>>();
}

void f23(FNamed n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<FNamed>>();
}

void f24<X extends Never>(FNamed n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<FNamed>>();
}

void f25(Rec n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Rec>>();
}

void f26<X extends Never>(Rec n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<Rec>>();
}

void f27(E n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<E>>();
}

void f28<X extends Never>(E n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<E>>();
}

void f29(ET n1, Never n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<ET>>();
}

void f30<X extends Never>(ET n1, X n2) {
  var v = (1 > 2) ? n1 : n2;
  v.expectStaticType<Exactly<ET>>();
}

void main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f7);
  print(f8);
  print(f9);
  print(f10);
  print(f11);
  print(f12);
  print(f13);
  print(f14);
  print(f15);
  print(f16);
  print(f17);
  print(f18);
  print(f19);
  print(f20);
  print(f21);
  print(f22);
  print(f23);
  print(f24);
  print(f25);
  print(f26);
  print(f27);
  print(f28);
  print(f29);
  print(f30);
}
