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
/// @description Check that UP(`T1`, `T2`) = `T1` if TOP(`T1`) and TOP(`T2`) and
/// MORETOP(`T1`, `T2`) and `T1` otherwise. Test type `Future<void>`.
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
}

void f3(FutureOr<dynamic> y) {
  var v = (1 > 2) ? getFutureOrVoid() : y; // MORETOP(FutureOr<void>, FutureOr<dynamic>) = true
  v.expectStaticType<Exactly<FutureOr<void>>>();
}

void f4(FutureOr<Object?> y) {
  var v = (1 > 2) ? getFutureOrVoid() : y; // MORETOP(FutureOr<void>, FutureOr<Object?>) = true
  v.expectStaticType<Exactly<FutureOr<void>>>();
}

void main() {
  f1(1);
  f2(2);
  f3(3);
  f4(4);
}
