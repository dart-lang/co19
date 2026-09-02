// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`FutureOr<T1>`, `Future<T2>`) = `FutureOr<T3>` where `T3` = UP(`T1`,
///   `T2`)
///
/// @description Check that UP(`FutureOr<T1>`, `Future<T2>`) = `FutureOr<T3>`
/// where `T3` = UP(`T1`, `T2`), when further:
/// `FutureOr<T1> != FutureOr<T2>` and neither `FutureOr<T1>` nor `FutureOr<T2>`
/// is TOP or OBJECT. Note that `FutureOr<...>` is never BOTTOM, NULL, an
/// intersection type, a type of the form `U?`, a type variable, `Function`, a
/// function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(FutureOr<int> t1, Future<num> t2) {
  // UP(FutureOr<int>, Future<num>) = FutureOr<UP(int, num)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f1b(FutureOr<num> t1, Future<int> t2) {
  // UP(FutureOr<num>, Future<int>) = FutureOr<UP(num, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f2a(FutureOr<String> t1, Future<int> t2) {
  // UP(FutureOr<String>, Future<Object>) = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  // `expectStaticType` cannot distinguish between `Object` and
  // `FutureOr<Object>`. Therefore, here and below we check that the type of `v`
  // is `Object`.
  v.expectStaticType<Exactly<Object>>();
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is `FutureOr<Object>`.
}

void f2b(FutureOr<int> t1, Future<String> t2) {
  // UP(FutureOr<Object>, Future<String>) = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f3a(FutureOr<D<num, String>> t1, Future<D<int, Object>> t2) {
  // FutureOr<UP(D<num, String>, D<int, Object>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f3b(FutureOr<D<int, Object>> t1, Future<D<num, String>> t2) {
  // FutureOr<UP(D<int, Object>, D<num, String>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f4a(FutureOr<E> t1, Future<int> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(E, Object)> = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f4b(FutureOr<int> t1, Future<E> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(Object, E)> = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f5a(FutureOr<E> t1, Future<Enum> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(E, Enum)> = FutureOr<Enum>
  v.expectStaticType<Exactly<FutureOr<Enum>>>();
}

void f5b(FutureOr<Enum> t1, Future<E> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(Enum, E)> = FutureOr<Enum>
  v.expectStaticType<Exactly<FutureOr<Enum>>>();
}

void f6a(FutureOr<int?> t1, Future<num> t2) {
  // FutureOr<UP(int?, num)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f6b(FutureOr<num> t1, Future<int?> t2) {
  // FutureOr<UP(num, int?)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f7a(FutureOr<Null> t1, Future<int> t2) {
  // FutureOr<UP(Null, int)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f7b(FutureOr<int> t1, Future<Null> t2) {
  // FutureOr<UP(int, Null)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f8a(FutureOr<(int,)> t1, Future<(num,)> t2) {
  // FutureOr<UP((int,), (num,))> = FutureOr<(num,)>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num,)>>>();
}

void f8b(FutureOr<(num,)> t1, Future<(int,)> t2) {
  // FutureOr<UP((num,), (int,))> = FutureOr<(num,)>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num,)>>>();
}

void f9a(FutureOr<(int,)> t1, Future<(int, String)> t2) {
  // FutureOr<UP((int,), (int, String))> = FutureOr<Record>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Record>>>();
}

void f9b(FutureOr<(int, String)> t1, Future<(int,)> t2) {
  // FutureOr<UP((int, String), (int,))> = FutureOr<Record>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Record>>>();
}

void f10a(FutureOr<int Function()> t1, Future<Function> t2) {
  // FutureOr<UP(int Function(), Function)> = FutureOr<Function>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Function>>>();
}

void f10b(FutureOr<Function> t1, Future<int Function()> t2) {
  // FutureOr<UP(Function, int Function())> = FutureOr<Function>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Function>>>();
}

void f11a(FutureOr<()> t1, Future<num> t2) {
  // FutureOr<UP((), num)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f11b(FutureOr<num> t1, Future<()> t2) {
  // FutureOr<UP(num, ())> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f12a<X extends num>(FutureOr<X> t1, Future<int> t2) {
  // FutureOr<UP(X, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f12b<X extends num>(FutureOr<int> t1, Future<X> t2) {
  // FutureOr<UP(int, X)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f13a(FutureOr<Rec> t1, Future<(num, Object, {Object b})> t2) {
  // FutureOr<UP(Rec, (num, Object, {Object b}))> = FutureOr<(num, Object, {Object b})>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num, Object, {Object b})>>>();
}

void f13b(FutureOr<(num, Object, {Object b})> t1, Future<Rec> t2) {
  // FutureOr<UP((num, Object, {Object b}), Rec)> = FutureOr<(num, Object, {Object b})>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num, Object, {Object b})>>>();
}

void f14a(FutureOr<Never> t1, Future<int> t2) {
  // FutureOr<UP(Never, int)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f14b(FutureOr<int> t1, Future<Never> t2) {
  // FutureOr<UP(int, Never)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f15a<T1 extends num, T2 extends T1>(FutureOr<T1> t1, Future<T2> t2) {
  if (t1 is FutureOr<T2>) {
    // FutureOr<UP(T1&T2, T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f15b<T1 extends num, T2 extends T1>(FutureOr<T2> t1, Future<T1> t2) {
  if (t2 is Future<T2>) {
    // FutureOr<UP(T2, T1&T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f16a(FutureOr<Never> t1, Future<Null> t2) {
  // FutureOr<UP(Never, Null)> = FutureOr<Null>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void f16b(FutureOr<Null> t1, Future<Never> t2) {
  // FutureOr<UP(Null, Never)> = FutureOr<Null>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void f17(FutureOr<int> t1, Future<Object> t2) {
  // FutureOr<UP(int, Object)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext(); // Throws if `v` is `Object`
}

void f18(FutureOr<int> t1, Future<dynamic> t2) async {
  // FutureOr<UP(int, dynamic)> = FutureOr<dynamic>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).proofDynamic;
  }
}

void main() {
  f1a(1, Future.value(1.0));
  f1b(1, Future.value(1));
  f2a('s', Future.value(1));
  f2b(1, Future.value('s'));
  f3a(D<num, String>(), Future.value(D<int, Object>()));
  f3b(D<int, Object>(), Future.value(D<num, String>()));
  f4a(E.e0, Future.value(1));
  f4b(1, Future.value(E.e0));
  f5a(E.e0, Future.value(E.e0));
  f5b(E.e0, Future.value(E.e0));
  f6a(1, Future.value(1.0));
  f6b(1, Future.value(1));
  f7a(null, Future.value(1));
  f7b(1, Future.value(null));
  f8a((1,), Future.value((1.0,)));
  f8b((1,), Future.value((1,)));
  f9a((1,), Future.value((1, 's')));
  f9b((1, 's'), Future.value((1,)));
  f10a(() => 1, Future.value(() {}));
  f10b(() {}, Future.value(() => 1));
  f11a((), Future.value(1));
  f11b(1, Future.value(()));
  f12a<int>(1, Future.value(1));
  f12b<int>(1, Future.value(1));
  f13a((1, 's', b: true), Future.value((1.0, true, b: Object())));
  f13b((1.0, true, b: Object()), Future.value((1, 's', b: true)));
  print(f14a);
  print(f14b);
  f15a(1, Future.value(2));
  f15b(1, Future.value(2));
  print(f16a);
  print(f16b);
  f17(1, Future.value(2));
  f18(1, Future.value(2));
}
