// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`FutureOr<T1>`, `T2`) = `FutureOr<T3>` where `T3` = UP(`T1`, `T2`)
///
/// @description Check that UP(`FutureOr<T1>`, `T2`) = `FutureOr<T3>` where
/// `T3` = UP(`T1`, `T2`). `T2` is neither TOP, BOTTOM, NULL, OBJECT, a function
/// type, a record type, `Future`/`FutureOr`, `T?` nor an intersection type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(FutureOr<int> t1, num t2) {
  // UP(FutureOr<int>, num) = FutureOr<UP(int, num)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f1b(FutureOr<num> t1, int t2) {
  // UP(FutureOr<num>, int) = FutureOr<UP(num, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f2a(FutureOr<String> t1, int t2) {
  // UP(FutureOr<String>, int) = FutureOr<UP(String, int)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is not `Object`.
}

void f2b(FutureOr<int> t1, String t2) {
  // UP(FutureOr<int>, String) = FutureOr<UP(int, String)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is not `Object`.
}

void f3a(FutureOr<D<num, String>> t1, D<int, Object> t2) {
  // FutureOr<UP(D<num, String>, D<int, Object>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f3b(FutureOr<D<int, Object>> t1, D<num, String> t2) {
  // FutureOr<UP(D<int, Object>, D<num, String>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f4a(FutureOr<String> t1, E t2) {
  // FutureOr<UP(String, E)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f4b(FutureOr<E> t1, String t2) {
  // FutureOr<UP(E, String)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f5a(FutureOr<ET2> t1, ET t2) {
  // FutureOr<UP(ET2, ET)> = FutureOr<ET> (ET2 <: ET)
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<ET>>>();
}

void f5b(FutureOr<ET> t1, ET2 t2) {
  // FutureOr<UP(ET, ET2)> = FutureOr<ET> (ET2 <: ET)
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<ET>>>();
}

void f6(FutureOr<int?> t1, num t2) {
  // FutureOr<UP(int?, num)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f7(FutureOr<Null> t1, int t2) {
  // FutureOr<UP(Null, int)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f8<X extends num>(FutureOr<X> t1, int t2) {
  // FutureOr<UP(X, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f9(FutureOr<Never> t1, int t2) {
  // FutureOr<UP(Never, int)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f10<T1 extends num, T2 extends T1>(FutureOr<T1> t1, T2 t2) {
  if (t1 is FutureOr<T2>) {
    // FutureOr<UP(T1&T2, T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f11(FutureOr<Function> t1, int t2) {
  // FutureOr<UP(Function, int)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void main() {
  f1a(1, 1.0);
  f1b(1, 1);
  f2a('s', 1);
  f2b(1, 's');
  f3a(D<num, String>(), D<int, Object>());
  f3b(D<int, Object>(), D<num, String>());
  f4a('s', E.e0);
  f4b(E.e0, 's');
  f5a(ET2(ET(0)), ET(0));
  f5b(ET(0), ET2(ET(0)));
  f6(1, 1);
  f7(null, 1);
  f8(1, 1);
  print(f9);
  f10(1, 1);
  f11(fPositional, 1);
}
