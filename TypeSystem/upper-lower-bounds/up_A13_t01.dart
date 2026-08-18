// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where OBJECT(`T1`) and OBJECT(`T2`) =
///   - `T1` if MORETOP(`T1`, `T2`)
///   - `T2` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T1` if `T1 != T2` and OBJECT(`T1`)
/// and OBJECT(`T2`) and MORETOP(`T1`, `T2`). Test that `Object` is more top
/// than `FutureOr<Object>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

void f1(Object x, FutureOr<Object> y) {
  var v = (1 > 2) ? x : y; // MORETOP(Object, FutureOr<Object>) = true
  v.expectStaticType<Exactly<Object>>();
}

void f2(Object x, FutureOr<FutureOr<Object>> y) {
  var v = (1 > 2) ? x : y; // MORETOP(Object, FutureOr<FutureOr<Object>>) = true
  v.expectStaticType<Exactly<Object>>();
}

void f3(FutureOr<Object> x, FutureOr<FutureOr<Object>> y) {
  // MORETOP(FutureOr<Object>, FutureOr<FutureOr<Object>>) =
  // MORETOP(Object, FutureOr<Object>) = true
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
}

void main() {
  f1(1, 2);
  f2(1, 2);
  f3(1, 2);
}
