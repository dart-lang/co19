// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`(S0, ... Sk, {T0 d0, ..., Tn dn})`,
///      `(S0', ... Sk', {T0' d0, ..., Tn' dn})`) =
///   `(Q0, ...,Qk, {R0, ..., Rn})` if:
///     - `Qi` is UP(`Si`, `Si'`)
///     - `Ri` is UP(`Ti`, `Ti'`)
///
/// @description Check that UP of two record types with the same shape is a
/// record type of that shape where each field type is UP of the corresponding
/// field types.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(() t1, () t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<()>>();
}

void f2((int,) t1, (num,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num,)>>();
}

void f3((int, String) t1, (num, Object) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num, Object)>>();
}

void f4((num?, String) t1, (int, Object?) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num?, Object?)>>();
}

void f5(({int i}) t1, ({num i}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({num i})>>();
}

void f6(({Object? i, String s}) t1, ({dynamic i, Object s}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<({dynamic i, Object s})>>();
  if (1 > 2) {
    v.i.proofDynamic;
  }
}

void f7((dynamic, {String s}) t1, (Object?, {Object s}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(dynamic, {Object s})>>();
  if (1 > 2) {
    v.$1.proofDynamic;
  }
}

void f8(Rec t1, (num, Object, {Object b}) t2) {
  var v = (1 > 2) ? t1 : t2; // Rec = (int, String, {bool b})
  v.expectStaticType<Exactly<(num, Object, {Object b})>>();
}

void f9((int, (String,)) t1, (num, (Object,)) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num, (Object,))>>();
}

void f10((int?,) t1, (num,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num?,)>>();
}

void f11((int,) t1, (String?,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Object?,)>>();
}

void f12((FutureOr<int>,) t1, (num,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(FutureOr<num>,)>>();
}

void f14((E,) t1, (Object,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Object,)>>();
}

void f15((ET,) t1, (Object,) t2) {
  // `ET` is neither non-nullable nor nullable; UP(ET, Object) = Object?
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Object?,)>>();
}

void f16<X extends num>((X,) t1, (num,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num,)>>();
}

void f17<X extends num>((X, String) t1, (int, Object) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(num, Object)>>();
}

void f18((D<int, String>,) t1, (D<num, Object>,) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(D<num, Object>,)>>();
}

void f19(
  (Function, {int Function() x}) t1,
  (int Function(), {num Function() x}) t2,
) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Function, {num Function() x})>>();
}

void f20((Function, {Never x}) t1, (Never, {int x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Function, {int x})>>();
}

void f21((Object, {Null x}) t1, (Null, {int x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Object?, {int? x})>>();
}

void f22((E, {ET? x}) t1, (E?, {ET x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(E?, {ET? x})>>();
}

void f23((ET, {Object x}) t1, (Object, {ET x}) t2) {
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<(Object?, {Object? x})>>();
}

void f24<T1 extends num, T2 extends T1>((T1,) t1, (T2,) t2) {
  if (t1 is (T2,)) {
    var v = (1 > 2) ? t2 : t1;
    v.expectStaticType<Exactly<(T2,)>>();
  }
}

void f25<T1 extends num, T2 extends T1>(({T1 t}) t1, ({T2 t}) t2) {
  if (t1 is ({T2 t})) {
    var v = (1 > 2) ? t2 : t1;
    v.expectStaticType<Exactly<({T2 t})>>();
  }
}

void main() {
  f1((), ());
  f2((1,), (1.0,));
  f3((1, 's'), (1.0, true));
  f4((1.0, 's'), (1, true));
  f5((i: 1), (i: 1.0));
  f6((i: 1, s: 's'), (i: 1.0, s: true));
  f7((1, s: 's'), (1.0, s: true));
  f8((1, 's', b: true), (1.0, true, b: Object()));
  f9((1, ('s',)), (1.0, (Object(),)));
  f10((1,), (1.0,));
  f11((1,), (null,));
  f12((1,), (1.0,));
  f14((E.e0,), (Object(),));
  f15((ET(0),), (Object(),));
  f16<int>((1,), (1.0,));
  f17<int>((1, 's'), (1, true));
  f18((D<int, String>(),), (D<num, Object>(),));
  f19((() {}, x: () => 1), (() => 2, x: () => 3.14));
  print(f20);
  f21((1, x: null), (null, x: 2));
  f22((E.e0, x: null), (null, x: ET(0)));
  f23((ET(0), x: 1), (1, x: ET(0)));
  f24<num, int>((1,), (2,));
  f25<num, int>((t: 1), (t: 2));
}
