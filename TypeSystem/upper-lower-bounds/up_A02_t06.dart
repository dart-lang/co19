// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where TOP(`T1`) and TOP(`T2`) =
///   - `T1` if MORETOP(`T1`, `T2`)
///   - `T2` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1` if `T1 != T2` and TOP(`T1`)
/// and TOP(`T2`) and MORETOP(`T1`, `T2`) or `T2` otherwise. Test that `dynamic`
/// and `FutureOr<dynamic>` are more top than `Object?`.
/// @note README.md contains a detailed explanation of why and how we are
/// checking the type of TOP and OBJECT.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

void f1(FutureOr<dynamic> x, Object? y) async {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<dynamic>, Object?) = true
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  // See README.md for an explanation of each step in the checks below.
  v.checkNotDynamic; // Rejects `dynamic` and `Never`
//  ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (await v).checkDynamic;
  v = 1; // Rejects `FutureOr<Never>`
}

void f2(FutureOr<dynamic> x, FutureOr<Object?> y) async {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<dynamic>, FutureOr<Object?>) = true
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  // See README.md for an explanation of each step in the checks below.
  v.checkNotDynamic; // Rejects `dynamic` and `Never`
//  ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (await v).checkDynamic;
  v = 1; // Rejects `FutureOr<Never>`
}

void f3(Object? x, FutureOr<dynamic> y) async {
  var v = (1 > 2) ? x : y; // MORETOP(Object?, FutureOr<dynamic>) = false
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  // See README.md for an explanation of each step in the checks below.
  v.checkNotDynamic; // Rejects `dynamic` and `Never`
//  ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (await v).checkDynamic;
  v = 1; // Rejects `FutureOr<Never>`
}

void f4(FutureOr<Object?> x, FutureOr<dynamic> y) async {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<Object?>, FutureOr<dynamic>) = false
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  // See README.md for an explanation of each step in the checks below.
  v.checkNotDynamic; // Rejects `dynamic` and `Never`
//  ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (await v).checkDynamic;
  v = 1; // Rejects `FutureOr<Never>`
}

void main() {
  f1(1, 2);
  f2(1, 2);
  f3(1, 2);
  f4(1, 2);
}
