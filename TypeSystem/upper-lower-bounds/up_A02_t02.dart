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
/// and TOP(`T2`) and MORETOP(`T1`, `T2`) or `T2` otherwise. Test type
/// `FutureOr<void>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

FutureOr<void> getFutureOrVoid() {}

void f1(dynamic y) {
  var v = (1 > 2) ? getFutureOrVoid() : y; // MORETOP(FutureOr<void>, dynamic) = false
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f2(Object? y) {
  var v = (1 > 2) ? getFutureOrVoid() : y; // MORETOP(FutureOr<void>, Object?) = true
  v.expectStaticType<Exactly<FutureOr<void>>>();
  // v.expectStaticType<Exactly<Object?>>(); also succeeds.
  // Let's check that the type `void` cannot be used.
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3(FutureOr<dynamic> y) async {
  var v = (1 > 2) ? getFutureOrVoid() : y; // MORETOP(FutureOr<void>, FutureOr<dynamic>) = true
  v.expectStaticType<Exactly<FutureOr<void>>>();
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4(FutureOr<Object?> y) async {
  var v = (1 > 2) ? getFutureOrVoid() : y; // MORETOP(FutureOr<void>, FutureOr<Object?>) = true
  v.expectStaticType<Exactly<FutureOr<void>>>();
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  f1(1);
  f2(2);
  f3(3);
  f4(4);
}
