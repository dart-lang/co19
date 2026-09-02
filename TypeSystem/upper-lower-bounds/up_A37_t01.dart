// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = UP(`T1`, `T2`)
///
/// @description Check that UP(`T1`, `FutureOr<T2>`) = `FutureOr<T3>` where
/// `T3` = UP(`T1`, `T2`), when further: `FutureOr<T2>` is neither TOP nor
/// OBJECT, and `T1` is neither TOP, BOTTOM, NULL, OBJECT, `Function`, a
/// function type, `Record`, a record type, `Future`/`FutureOr`, `T?` nor an
/// intersection type. Note that `FutureOr<...>` is never BOTTOM, NULL, an
/// intersection type, a type of the form `U?`, a type variable, `Function`, a
/// function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(int t1, FutureOr<num> t2) {
  // UP(int, FutureOr<num>) = FutureOr<UP(int, num)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f1b(num t1, FutureOr<int> t2) {
  // UP(num, FutureOr<int>) = FutureOr<UP(num, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f2a(String t1, FutureOr<int> t2) {
  // UP(String, FutureOr<int>) = FutureOr<UP(String, int)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  // `expectStaticType` cannot distinguish between `Object` and
  // `FutureOr<Object>`. Therefore, here and below we check that the type of `v`
  // is `Object`.
  v.expectStaticType<Exactly<Object>>();
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is not `Object`.
}

void f2b(int t1, FutureOr<String> t2) {
  // UP(int, FutureOr<String>) = FutureOr<UP(int, String)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is not `Object`.
}

void f3a(D<num, String> t1, FutureOr<D<int, Object>> t2) {
  // FutureOr<UP(D<num, String>, D<int, Object>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f3b(D<int, Object> t1, FutureOr<D<num, String>> t2) {
  // FutureOr<UP(D<int, Object>, D<num, String>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f4a(String t1, FutureOr<E> t2) {
  // FutureOr<UP(String, E)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f4b(E t1, FutureOr<String> t2) {
  // FutureOr<UP(E, String)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f5a(ET2 t1, FutureOr<ET> t2) {
  // FutureOr<UP(ET2, ET)> = FutureOr<ET> (ET2 <: ET)
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<ET>>>();
}

void f5b(ET t1, FutureOr<ET2> t2) {
  // FutureOr<UP(ET, ET2)> = FutureOr<ET> (ET2 <: ET)
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<ET>>>();
}

void f6(num t1, FutureOr<int?> t2) {
  // FutureOr<UP(num, int?)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f7(int t1, FutureOr<Null> t2) {
  // FutureOr<UP(int, Null)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f8<X extends num>(int t1, FutureOr<X> t2) {
  // FutureOr<UP(int, X)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f9(int t1, FutureOr<Never> t2) {
  // FutureOr<UP(int, Never)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f10<T1 extends num, T2 extends T1>(T2 t1, FutureOr<T1> t2) {
  if (t2 is FutureOr<T2>) {
    // FutureOr<UP(T2, T1&T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f11(int t1, FutureOr<Function> t2) {
  // FutureOr<UP(int, Function)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
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
  f7(1, null);
  f8(1, 1);
  print(f9);
  f10(1, 1);
  f11(1, fPositional);
}
