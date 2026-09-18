// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T Function<...>(...)`) = UP(`T1`, `Object`)
///
/// @description Check that UP(`T1`, `T Function<...>(...)`) = UP(`T1`,`Object`)
/// where `T1` is not a function type and also neither TOP, BOTTOM, NULL,
/// OBJECT nor intersection type.
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, or
/// BOTTOM, and they are not intersection types, or of the form `T?`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(num t1, int Function() t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, int Function()) = UP(num, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  // Check that `v` is `Object`, not `FutureOr<Object>`.
  // See README.md for an explanation of each step in the checks below.
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f2(String t1, void Function(int) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(String, void Function(int)) = UP(String, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f3(C t1, FPositional t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C, FPositional) = UP(C, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f4(D<int, String> t1, FNamed t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(D<int, String>, FNamed) = UP(D<int, String>, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f5(Record t1, int Function([int]) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(Record, int Function([int])) = UP(Record, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f6(Rec t1, int Function({int i}) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(Rec, int Function({int i})) = UP(Rec, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f7(E t1, void Function<X extends num>(X) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(E, void Function<X extends num>(X)) = UP(E, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f8(FutureOr<int> t1, FPositional t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(FutureOr<int>, FPositional) = UP(FutureOr<int>, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f9<X extends num>(X t1, int Function(X) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(X, int Function(X)) = UP(X, Object) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f10(ET t1, void Function<X extends num>(X) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(ET, void Function<X extends num>(X)) = UP(ET, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  // Check that `v` is neither `FutureOr<Object>?` nor `FutureOr<Object?>`.
  // See README.md for an explanation of each step in the checks below.
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void main() {
  f1(1, () => 1);
  f2('s', (int i) {});
  f3(C(), <X extends num>(X x, [int i = 0]) => 0);
  f4(D<int, String>(), <X extends num>(X x, {int i = 0}) => 0);
  f5((1,), ([int i = 0]) => i);
  f6((1, 'two', b: true), ({int i = 0}) => i);
  f7(E.e0, <X extends num>(X x) {});
  f8(1, <X extends num>(X x, [int i = 0]) => 0);
  f9<int>(1, (int x) => x);
  f10(ET(0), <X extends num>(X x) {});
}
