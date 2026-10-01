// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if TOP(`T1`)
///
/// @description Check that UP(`T1`, `T2`) = `T1` if TOP(`T1`) and not TOP(`T2`)
/// (which implies `T1 != T2`). Test types `Object?` and `FutureOr<Object?>`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(Object? o, num n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f1b(FutureOr<Object?> o, num n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f2a<X extends num>(Object? o, X n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f2b<X extends num>(FutureOr<Object?> o, X n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f3a(Object? o) {
  var v = (1 > 2) ? o : null;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f3b(FutureOr<Object?> o) {
  var v = (1 > 2) ? o : null;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f4a(Object? o, Never n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f4b(FutureOr<Object?> o, Never n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f5a(Object? o, Function n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f5b(FutureOr<Object?> o, Function n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f6a(Object? o, Record n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f6b(FutureOr<Object?> o, Record n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f7a(Object? o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f7b(FutureOr<Object?> o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f8a(Object? o, String? n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f8b(FutureOr<Object?> o, String? n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f9a(Object? o, C n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f9b(FutureOr<Object?> o, C n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f10a(Object? o, D<int, String> n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f10b(FutureOr<Object?> o, D<int, String> n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f11a(Object? o, FPositional n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f11b(FutureOr<Object?> o, FPositional n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f12a(Object? o, FNamed n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f12b(FutureOr<Object?> o, FNamed n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f13a(Object? o, Rec n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f13b(FutureOr<Object?> o, Rec n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f14a(Object? o, E n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f14b(FutureOr<Object?> o, E n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f15a(Object? o, ET n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f15b(FutureOr<Object?> o, ET n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void f16a(Object? o, Future<dynamic> n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void f16b(FutureOr<Object?> o, Future<dynamic> n) {
  var v = (1 > 2) ? o : n;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object?>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object?>>>();
  v = probeFuture2()..expectStaticType<Exactly<Future<Future<dynamic>>>>();
  v = probeFutureOr2()..expectStaticType<Exactly<Future<FutureOr<Object>>>>();
}

void main() {
  f1a(null, 1);
  f1b(null, 1);
  f2a<int>(null, 1);
  f2b<int>(null, 1);
  f3a(null);
  f3b(null);
  print(f4a);
  print(f4b);
  f5a(null, () {});
  f5b(null, () {});
  f6a(null, ());
  f6b(null, ());
  f7a(null, 1);
  f7b(null, 1);
  f8a(null, 's');
  f8b(null, 's');
  f9a(null, C());
  f9b(null, C());
  f10a(null, D<int, String>());
  f10b(null, D<int, String>());
  f11a(null, fPositional);
  f11b(null, fPositional);
  f12a(null, fNamed);
  f12b(null, fNamed);
  f13a(null, (1, 'two', b: true));
  f13b(null, (1, 'two', b: true));
  f14a(null, E.e0);
  f14b(null, E.e0);
  f15a(null, ET(0));
  f15b(null, ET(0));
  f16a(null, Future<dynamic>.value(1));
  f16b(null, Future<dynamic>.value(1));
}
