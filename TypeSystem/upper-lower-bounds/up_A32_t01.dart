// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`(...)`, `T2`) = UP(`Object`, `T2`)
///
/// @description Check that UP(`(...)`, `T2`) = UP(`Object`, `T2`) = `Object`
/// if `T2` is not `T?` and is neither a record type, TOP, BOTTOM, NULL, OBJECT,
/// function type nor an intersection type.
/// Note that no earlier rule applies because record types are never TOP, OBJECT,
/// NULL, BOTTOM, intersection types, types of the form `T?`, type variables,
/// function types, or `Function`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(() t1, num t2) {
  var v = (1 > 2) ? t1 : t2; // UP((), num) = UP(Object, num) = Object
  v.expectStaticType<Exactly<Object>>();
  // Check that `v` is `Object`, not `FutureOr<Object>`.
  // See README.md for an explanation of each step in the checks below.
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f2((int,) t1, String t2) {
  var v = (1 > 2) ? t1 : t2; // UP((int,), String) = UP(Object, String) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f3((dynamic, String) t1, C t2) {
  var v = (1 > 2) ? t1 : t2; // UP((dynamic, String), C) = UP(Object, C) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f4((void, {String s}) t1, D<int, String> t2) {
  // UP((void, {String s}), D<int, String>) = UP(Object, D<int, String>) = Object
  var v = (1 > 2) ? t1 : t2;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f5(({Object? i, String s}) t1, E t2) {
  var v = (1 > 2) ? t1 : t2; // UP(({Object? i, String s}), E) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f6(Rec t1, FutureOr<int> t2) {
  // UP(Rec, FutureOr<int>) = UP(Object, FutureOr<int>) = Object
  var v = (1 > 2) ? t1 : t2;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f7((E,) t1, int t2) {
  // UP((E,), int) = UP(Object, int) = Object
  var v = (1 > 2) ? t1 : t2;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f8((FutureOr<int>,) t1, bool t2) {
  // UP((FutureOr<int>,), bool) = UP(Object, bool) = Object
  var v = (1 > 2) ? t1 : t2;
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f9((Function,) t1, C t2) {
  var v = (1 > 2) ? t1 : t2; // UP((Function,), C) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f10((ET,) t1, num t2) {
  var v = (1 > 2) ? t1 : t2; // UP((ET,), num) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f11((Never,) t1, String t2) {
  var v = (1 > 2) ? t1 : t2; // UP((Never,), String) = Object
  // See README.md for an explanation of each step in the checks below.
  v.expectStaticType<Exactly<Object>>();
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
}

void f12((int,) t1, ET t2) {
  var v = (1 > 2) ? t1 : t2; // UP((int,), ET) = UP(Object, ET) = Object?
  v.expectStaticType<Exactly<Object?>>();
  // Check that `v` is neither `FutureOr<Object>?` nor `FutureOr<Object?>`.
  // See README.md for an explanation of each step in the checks below.
  v = probeFuture()..expectStaticType<Exactly<Future<dynamic>>>();
  v = probeFutureOr()..expectStaticType<Exactly<FutureOr<Object>>>();
}

void main() {
  f1((), 1);
  f2((1,), 's');
  f3((1, 'two'), C());
  f4((1, s: 'two'), D<int, String>());
  f5((i: 1, s: 'two'), E.e0);
  f6((1, 'two', b: true), 1);
  f7((E.e0,), 1);
  f8((1,), true);
  f9((() {},), C());
  f10((ET(0),), 1);
  print(f11);
  f12((1,), ET(0));
}
