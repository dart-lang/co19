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
/// @description Check that UP(`T1`, `T2`) = `T1` if `T1 != T2`, `T1` and `T2`
/// are neither TOP, BOTTOM, NULL, nor intersection type, if OBJECT(`T1`), not
/// OBJECT(`T2`) and `T2` is non-nullable. Note that none of TOP(`T`),
/// BOTTOM(`T`), or NULL(`T`) holds when OBJECT(`T`), and `T` is not an
/// intersection type.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

// ignore_for_file: unused_local_variable

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(Object o, num n) {
  var v = (1 > 2) ? o : n; // UP(Object, num) = Object
  // Object and FutureOr<Object> are subtypes of each other, which means that we
  // can't see the difference using `expectStaticType()` function.
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f1b(FutureOr<Object> o, num n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, num) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f2a<X extends num>(Object o, X n) {
  var v = (1 > 2) ? o : n; // UP(Object, X) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f2b<X extends num>(FutureOr<Object> o, X n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, X) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f3a(Object o, Function n) {
  var v = (1 > 2) ? o : n; // UP(Object, Function) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f3b(FutureOr<Object> o, Function n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Function) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f4a(Object o, Record n) {
  var v = (1 > 2) ? o : n; // UP(Object, Record) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f4b(FutureOr<Object> o, Record n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Record) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f5a(Object o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n; // UP(Object, FutureOr<int>) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f5b(FutureOr<Object> o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FutureOr<int>) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f6a(Object o, C n) {
  var v = (1 > 2) ? o : n; // UP(Object, C) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f6b(FutureOr<Object> o, C n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, C) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f7a(Object o, D<int, String> n) {
  var v = (1 > 2) ? o : n; // UP(Object, D<int, String>) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f7b(FutureOr<Object> o, D<int, String> n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, D<int, String>) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f8a(Object o, FPositional n) {
  var v = (1 > 2) ? o : n; // UP(Object, FPositional) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f8b(FutureOr<Object> o, FPositional n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FPositional) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f9a(Object o, FNamed n) {
  var v = (1 > 2) ? o : n; // UP(Object, FNamed) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f9b(FutureOr<Object> o, FNamed n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, FNamed) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f10a(Object o, Rec n) {
  var v = (1 > 2) ? o : n; // UP(Object, Rec) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f10b(FutureOr<Object> o, Rec n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, Rec) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void f11a(Object o, E n) {
  var v = (1 > 2) ? o : n; // UP(Object, E) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f11b(FutureOr<Object> o, E n) {
  var v = (1 > 2) ? o : n; // UP(FutureOr<Object>, E) = FutureOr<Object>
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<Object>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
}

void main() {
  f1a(1, 1);
  f1b(1, 1);
  f2a(1, 1);
  f2b(1, 1);
  f3a(1, () {});
  f3b(1, () {});
  f4a(1, (1,));
  f4b(1, (1,));
  f5a(1, 1);
  f5b(1, 1);
  f6a(1, C());
  f6b(1, C());
  f7a(1, D<int, String>());
  f7b(1, D<int, String>());
  f8a(1, <X extends num>(X x, [int i = 0]) => 0);
  f8b(1, <X extends num>(X x, [int i = 0]) => 0);
  f9a(1, <X extends num>(X x, {int i = 0}) => 0);
  f9b(1, <X extends num>(X x, {int i = 0}) => 0);
  f10a(1, (1, 'two', b: true));
  f10b(1, (1, 'two', b: true));
  f11a(1, E.e0);
  f11b(1, E.e0);
}
