// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T1`) =
///   - `T1` if `T2` is non-nullable
///   - `T1?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1?` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T1`), not
/// OBJECT(`T2`) and `T2` is not non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

// ignore_for_file: unused_local_variable

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(Object o, num? n) {
  var v = (1 > 2) ? o : n; // UP(Object, num?) = Object?
  // `Object?`, `FutureOr<Object>?` and `FutureOr<Object?>` are subtypes of each
  // other, which means that we can't see the difference using
  // `expectStaticType()` function. See the table in README.md for more details.
  v.expectStaticType<Exactly<Object?>>(); // Check that `v`'s type is TOP.
  // Check that `v` is neither `FutureOr<Object>?` nor `FutureOr<Object?>`.
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f1b(FutureOr<Object> o, num? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, num?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  // Check that `v` is neither `Object?` nor `FutureOr<FutureOr<Object>>?`.
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f2a<X extends num>(Object o, X? n) {
  var v = (1 > 2) ? o : n; // UP(Object, X?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f2b<X extends num>(FutureOr<Object> o, X? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, X?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f3a<X extends num?>(Object o, X n) {
  var v = (1 > 2) ? o : n; // UP(Object, X?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f3b<X extends num?>(FutureOr<Object> o, X n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, X?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f4a(Object o, Function? n) {
  var v = (1 > 2) ? o : n; // UP(Object, Function?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f4b(FutureOr<Object> o, Function? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Function?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f5a(Object o, Record? n) {
  var v = (1 > 2) ? o : n; // UP(Object, Record?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f5b(FutureOr<Object> o, Record? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Record?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f6a(Object o, FutureOr<int>? n) {
  var v = (1 > 2) ? o : n; // UP(Object, FutureOr<int>?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f6b(FutureOr<Object> o, FutureOr<int>? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FutureOr<int>?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f7a(Object o, C? n) {
  var v = (1 > 2) ? o : n; // UP(Object, C?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f7b(FutureOr<Object> o, C? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, C?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f8a(Object o, D<int, String>? n) {
  var v = (1 > 2) ? o : n; // UP(Object, D<int, String>?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f8b(FutureOr<Object> o, D<int, String>? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, D<int, String>?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f9a(Object o, FPositional? n) {
  var v = (1 > 2) ? o : n; // UP(Object, FPositional?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f9b(FutureOr<Object> o, FPositional? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FPositional?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f10a(Object o, FNamed? n) {
  var v = (1 > 2) ? o : n; // UP(Object, FNamed?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f10b(FutureOr<Object> o, FNamed? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FNamed?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f11a(Object o, Rec? n) {
  var v = (1 > 2) ? o : n; // UP(Object, Rec?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f11b(FutureOr<Object> o, Rec? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Rec?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f12a(Object o, E? n) {
  var v = (1 > 2) ? o : n; // UP(Object, E?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f12b(FutureOr<Object> o, E? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, E?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f13a(Object o, ET? n) {
  var v = (1 > 2) ? o : n; // UP(Object, ET?) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f13b(FutureOr<Object> o, ET? n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, ET?) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f14a(Object o, ET n) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? o : n; // UP(Object, ET) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f14b(FutureOr<Object> o, ET n) {
  // `ET` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, ET) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f15a(Object t1, FutureOr<ET> t2) {
  // `FutureOr<ET>` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? t1 : t2; // UP(Object, FutureOr<ET>) = Object?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f15b(FutureOr<Object> t1, FutureOr<ET> t2) {
  // `FutureOr<ET>` is neither non-nullable (`ET <: Object` is false) nor nullable
  var v = (1 > 2) ? t1 : t2; // UP(FutureOr<Object>, FutureOr<ET>) = FutureOr<Object>?
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void main() {
  f1a(1, 1);
  f1b(1, 1);
  f2a(1, 1);
  f2b(1, 1);
  f3a(1, 1);
  f3b(1, 1);
  f4a(1, () {});
  f4b(1, () {});
  f5a(1, (1,));
  f5b(1, (1,));
  f6a(1, 1);
  f6b(1, 1);
  f7a(1, C());
  f7b(1, C());
  f8a(1, D<int, String>());
  f8b(1, D<int, String>());
  f9a(1, <X extends num>(X x, [int i = 0]) => 0);
  f9b(1, <X extends num>(X x, [int i = 0]) => 0);
  f10a(1, <X extends num>(X x, {int i = 0}) => 0);
  f10b(1, <X extends num>(X x, {int i = 0}) => 0);
  f11a(1, (1, 'two', b: true));
  f11b(1, (1, 'two', b: true));
  f12a(1, E.e0);
  f12b(1, E.e0);
  f13a(1, ET(0));
  f13b(1, ET(0));
  f14a(1, ET(0));
  f14b(1, ET(0));
  f15a(1, ET(0));
  f15b(1, ET(0));
}
