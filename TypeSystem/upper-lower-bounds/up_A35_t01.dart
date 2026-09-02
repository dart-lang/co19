// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`Future<T1>`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = UP(`T1`,
///   `T2`)
///
/// @description Check that UP(`Future<T1>`, `FutureOr<T2>`) = `FutureOr<T3>`
/// where `T3` = UP(`T1`, `T2`), when further:
/// `FutureOr<T1> != FutureOr<T2>` and neither `FutureOr<T1>` nor `FutureOr<T2>`
/// is TOP or OBJECT. Note that `FutureOr<...>` is never BOTTOM, NULL, an
/// intersection type, a type of the form `U?`, a type variable, `Function`, a
/// function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(Future<int> t1, FutureOr<num> t2) {
  // UP(Future<int>, FutureOr<num>) = FutureOr<UP(int, num)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f1b(Future<num> t1, FutureOr<int> t2) {
  // UP(Future<num>, FutureOr<int>) = FutureOr<UP(num, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f2a(Future<String> t1, FutureOr<int> t2) {
  // UP(Future<String>, FutureOr<int>) = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  // `expectStaticType` cannot distinguish between `Object` and
  // `FutureOr<Object>`. Therefore, here and below we check that the type of `v`
  // is `Object`.
  v.expectStaticType<Exactly<Object>>();
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  v = confirmFutureOrObjectContext(); // Check that `v`'s type is `FutureOr<Object>`.
}

void f2b(Future<int> t1, FutureOr<String> t2) {
  // UP(Future<Object>, FutureOr<String>) = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f3a(Future<D<num, String>> t1, FutureOr<D<int, Object>> t2) {
  // FutureOr<UP(D<num, String>, D<int, Object>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f3b(Future<D<int, Object>> t1, FutureOr<D<num, String>> t2) {
  // FutureOr<UP(D<int, Object>, D<num, String>)> = FutureOr<D<num, Object>>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<D<num, Object>>>>();
}

void f4a(Future<E> t1, FutureOr<int> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(E, int)> = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f4b(Future<int> t1, FutureOr<E> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(int, E)> = FutureOr<Object>
  v.expectStaticType<Exactly<FutureOr<Object>>>();
  v = confirmFutureOrObjectContext();
}

void f5a(Future<E> t1, FutureOr<Enum> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(E, Enum)> = FutureOr<Enum>
  v.expectStaticType<Exactly<FutureOr<Enum>>>();
}

void f5b(Future<Enum> t1, FutureOr<E> t2) {
  var v = (1 > 2) ? t1 : t2; // FutureOr<UP(Enum, E)> = FutureOr<Enum>
  v.expectStaticType<Exactly<FutureOr<Enum>>>();
}

void f6a(Future<int?> t1, FutureOr<num> t2) {
  // FutureOr<UP(int?, num)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f6b(Future<num> t1, FutureOr<int?> t2) {
  // FutureOr<UP(num, int?)> = FutureOr<num?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

void f7a(Future<Null> t1, FutureOr<int> t2) {
  // FutureOr<UP(Null, int)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f7b(Future<int> t1, FutureOr<Null> t2) {
  // FutureOr<UP(int, Null)> = FutureOr<int?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int?>>>();
}

void f8a(Future<(int,)> t1, FutureOr<(num,)> t2) {
  // FutureOr<UP((int,), (num,))> = FutureOr<(num,)>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num,)>>>();
}

void f8b(Future<(num,)> t1, FutureOr<(int,)> t2) {
  // FutureOr<UP((num,), (int,))> = FutureOr<(num,)>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num,)>>>();
}

void f9a(Future<(int,)> t1, FutureOr<(int, String)> t2) {
  // FutureOr<UP((int,), (int, String))> = FutureOr<Record>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Record>>>();
}

void f9b(Future<(int, String)> t1, FutureOr<(int,)> t2) {
  // FutureOr<UP((int, String), (int,))> = FutureOr<Record>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Record>>>();
}

void f10a(Future<int Function()> t1, FutureOr<Function> t2) {
  // FutureOr<UP(int Function(), Function)> = FutureOr<Function>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Function>>>();
}

void f10b(Future<Function> t1, FutureOr<int Function()> t2) {
  // FutureOr<UP(Function, int Function())> = FutureOr<Function>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Function>>>();
}

void f11a(Future<()> t1, FutureOr<num> t2) {
  // FutureOr<UP((), num)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f11b(Future<num> t1, FutureOr<()> t2) {
  // FutureOr<UP(num, ())> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext();
}

void f12a<X extends num>(Future<X> t1, FutureOr<int> t2) {
  // FutureOr<UP(X, int)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f12b<X extends num>(Future<int> t1, FutureOr<X> t2) {
  // FutureOr<UP(int, X)> = FutureOr<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<num>>>();
}

void f13a(Future<Rec> t1, FutureOr<(num, Object, {Object b})> t2) {
  // FutureOr<UP(Rec, (num, Object, {Object b}))> = FutureOr<(num, Object, {Object b})>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num, Object, {Object b})>>>();
}

void f13b(Future<(num, Object, {Object b})> t1, FutureOr<Rec> t2) {
  // FutureOr<UP((num, Object, {Object b}), Rec)> = FutureOr<(num, Object, {Object b})>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<(num, Object, {Object b})>>>();
}

void f14a(Future<Never> t1, FutureOr<int> t2) {
  // FutureOr<UP(Never, int)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f14b(Future<int> t1, FutureOr<Never> t2) {
  // FutureOr<UP(int, Never)> = FutureOr<int>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

void f15a<T1 extends num, T2 extends T1>(Future<T1> t1, FutureOr<T2> t2) {
  if (t1 is Future<T2>) {
    // FutureOr<UP(T1&T2, T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f15b<T1 extends num, T2 extends T1>(Future<T2> t1, FutureOr<T1> t2) {
  if (t2 is FutureOr<T2>) {
    // FutureOr<UP(T2, T1&T2)> = FutureOr<T2>
    var v = (1 > 2) ? t1 : t2;
    v.expectStaticType<Exactly<FutureOr<T2>>>();
  }
}

void f16a(Future<Never> t1, FutureOr<Null> t2) {
  // FutureOr<UP(Never, Null)> = FutureOr<Null>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void f16b(Future<Null> t1, FutureOr<Never> t2) {
  // FutureOr<UP(Null, Never)> = FutureOr<Null>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

void f17(Future<Object> t1, FutureOr<int> t2) {
  // FutureOr<UP(Object, int)> = FutureOr<Object>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmFutureOrObjectContext(); // Throws if `v` is `Object`
}

void f18(Future<dynamic> t1, FutureOr<int> t2) async {
  // FutureOr<UP(dynamic, int)> = FutureOr<dynamic>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).proofDynamic;
  }
}

void main() {
  f1a(Future.value(1), 1.0);
  f1b(Future.value(1), 1);
  f2a(Future.value('s'), 1);
  f2b(Future.value(1), 's');
  f3a(Future.value(D<num, String>()), D<int, Object>());
  f3b(Future.value(D<int, Object>()), D<num, String>());
  f4a(Future.value(E.e0), 1);
  f4b(Future.value(1), E.e0);
  f5a(Future.value(E.e0), E.e0);
  f5b(Future.value(E.e0), E.e0);
  f6a(Future.value(1), 1.0);
  f6b(Future.value(1), 1);
  f7a(Future.value(null), 1);
  f7b(Future.value(1), null);
  f8a(Future.value((1,)), (1.0,));
  f8b(Future.value((1,)), (1,));
  f9a(Future.value((1,)), (1, 's'));
  f9b(Future.value((1, 's')), (1,));
  f10a(Future.value(() => 1), () {});
  f10b(Future.value(() => 1), () => 1);
  f11a(Future.value(()), 1);
  f11b(Future.value(1), ());
  f12a<int>(Future.value(1), 1);
  f12b<int>(Future.value(1), 1);
  f13a(Future.value((1, 's', b: true)), (1.0, true, b: Object()));
  f13b(Future.value((1.0, true, b: Object())), (1, 's', b: true));
  print(f14a);
  print(f14b);
  f15a(Future.value(1), 2);
  f15b(Future.value(1), 2);
  print(f16a);
  print(f16b);
  f17(Future.value(1), 2);
  f18(Future.value(1), 2);
}
