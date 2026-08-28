// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`FutureOr<T1>`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = UP(`T1`,
///   `T2`)
///
/// @description Check that UP(`FutureOr<T1>`, `FutureOr<T2>`) = `FutureOr<T3>`
/// where `T3` = UP(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(FutureOr<int> t1, FutureOr<num> t2) {
  // UP(FutureOr<int>, FutureOr<num>) = FutureOr<UP(int, num)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f2(FutureOr<String> t1, FutureOr<int> t2) {
  // UP(FutureOr<String>, FutureOr<int>) = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is `FutureOr<Object>`.
}

void f3(FutureOr<C> t1, FutureOr<FutureOr<D<num, String>>> t2) {
  // FutureOr<UP(C, FutureOr<D<num, String>>)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f4(FutureOr<D<num, String>> t1, FutureOr<D<int, Object>> t2) {
  // FutureOr<UP(D<num, String>, D<int, Object>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f5(FutureOr<E> t1, FutureOr<int> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(E, int)> = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f6(FutureOr<int?> t1, FutureOr<num> t2) {
  // FutureOr<UP(int?, num)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f7(FutureOr<Null> t1, FutureOr<int> t2) {
  // FutureOr<UP(Null, int)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f8(FutureOr<(int,)> t1, FutureOr<(num,)> t2) {
  // FutureOr<UP((int,), (num,))> = FutureOr<(num,)>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num,)>>>();
}

void f9(FutureOr<(int,)> t1, FutureOr<(int, String)> t2) {
  // FutureOr<UP((int,), (int, String))> = FutureOr<Record>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Record>>>();
}

void f10(FutureOr<int Function()> t1, FutureOr<Function> t2) {
  // FutureOr<UP(int Function(), Function)> = FutureOr<Function>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Function>>>();
}

void f11(FutureOr<()> t1, FutureOr<num> t2) {
  // FutureOr<UP((), num)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f12<X extends num>(FutureOr<X> t1, FutureOr<int> t2) {
  // FutureOr<UP(X, num)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f13(FutureOr<Rec> t1, FutureOr<(num, Object, {Object b})> t2) {
  // FutureOr<UP(Rec, (num, Object, {Object b}))> = FutureOr<(num, Object, {Object b})>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num, Object, {Object b})>>>();
}

void f14(FutureOr<Never> t1, FutureOr<int> t2) {
  // FutureOr<UP(Never, int)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f15<T1 extends num, T2 extends T1>(FutureOr<T1> t1, FutureOr<T2> t2) {
  if (t1 is FutureOr<T2>) {
    // FutureOr<UP(T1&T2, T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f16(FutureOr<Never> t1, FutureOr<Null> t2) {
  // FutureOr<UP(Never, Null)> = FutureOr<Null>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void main() {
  f1(1, 1.0);
  f2('s', 1);
  f3(C(), D<num, String>());
  f4(D<num, String>(), D<int, Object>());
  f5(E.e0, 1);
  f6(1, 1.0);
  f7(null, 1);
  f8((1,), (1.0,));
  f9((1,), (1, 's'));
  f10(() => 1, () {});
  f11((), 1);
  f12<int>(1, 1);
  f13((1, 's', b: true), (1.0, true, b: Object()));
  print(f14);
  f15(1, 2);
  print(f16);
}
