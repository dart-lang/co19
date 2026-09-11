// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T2`) =
///   - `T2` if `T1` is non-nullable
///   - `T2?` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T2` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T2`), not
/// OBJECT(`T1`) and `T1` is non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

// ignore_for_file: unused_local_variable

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(num n, Object o) {
  var v = (1 > 2) ? n : o; // UP(num, Object) = Object
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  // See the table in README.md for more details.
  v.expectStaticType<Exactly<Object>>(); // Check that `v`'s type is `OBJECT`.
  // Check that `v` is not `FutureOr<Object>`.
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f1b(num n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(num, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  // Check that `v` is neither `Object` nor `FutureOr<FutureOr<Object>>`.
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f2a<X extends num>(X n, Object o) {
  var v = (1 > 2) ? n : o; // UP(X, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f2b<X extends num>(X n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(X, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f3a(Function n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Function, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f3b(Function n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Function, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f4a(Record n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Record, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f4b(Record n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Record, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f5a(FutureOr<int> n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FutureOr<int>, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f5b(FutureOr<int> n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FutureOr<int>, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f6a(C n, Object o) {
  var v = (1 > 2) ? n : o; // UP(C, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f6b(C n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(C, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f7a(D<int, String> n, Object o) {
  var v = (1 > 2) ? n : o; // UP(D<int, String>, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f7b(D<int, String> n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(D<int, String>, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f8a(FPositional n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FPositional, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f8b(FPositional n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FPositional, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f9a(FNamed n, Object o) {
  var v = (1 > 2) ? n : o; // UP(FNamed, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f9b(FNamed n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(FNamed, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f10a(Rec n, Object o) {
  var v = (1 > 2) ? n : o; // UP(Rec, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f10b(Rec n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(Rec, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f11a(E n, Object o) {
  var v = (1 > 2) ? n : o; // UP(E, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f11b(E n, FutureOr<Object> o) {
  var v = (1 > 2) ? n : o; // UP(E, FutureOr<Object>) = FutureOr<Object>
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void main() {
  f1a(1, 1);
  f1b(1, 1);
  f2a(1, 1);
  f2b(1, 1);
  f3a(() {}, 1);
  f3b(() {}, 1);
  f4a((1,), 1);
  f4b((1,), 1);
  f5a(1, 1);
  f5b(1, 1);
  f6a(C(), 1);
  f6b(C(), 1);
  f7a(D<int, String>(), 1);
  f7b(D<int, String>(), 1);
  f8a(<X extends num>(X x, [int i = 0]) => 0, 1);
  f8b(<X extends num>(X x, [int i = 0]) => 0, 1);
  f9a(<X extends num>(X x, {int i = 0}) => 0, 1);
  f9b(<X extends num>(X x, {int i = 0}) => 0, 1);
  f10a((1, 'two', b: true), 1);
  f10b((1, 'two', b: true), 1);
  f11a(E.e0, 1);
  f11b(E.e0, 1);
}
