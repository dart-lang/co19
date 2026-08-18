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
/// @description Check that UP(`T1`, `T2`) = `T2` if `T1 != T2` and OBJECT(`T1`)
/// and OBJECT(`T2`) and not MORETOP(`T1`, `T2`). Test that `Object` is more top
/// than `FutureOr<Object>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

void f1(FutureOr<Object> x, Object y) {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<Object>, Object) = false
  v.expectStaticType<Exactly<Object>>();
}

void f2(FutureOr<FutureOr<Object>> x, Object y) {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<FutureOr<Object>>, Object) = false
  v.expectStaticType<Exactly<Object>>();
}

void f3(FutureOr<FutureOr<Object>> x, FutureOr<Object> y) {
  // MORETOP(FutureOr<FutureOr<Object>>, FutureOr<Object>) =
  // MORETOP(FutureOr<Object>, Object) = false
  var v = (1 > 2) ? x : y;
  v.expectStaticType<Exactly<FutureOr<Object>>>();
}

void main() {
  f1(1, 2);
  f2(1, 2);
  f3(1, 2);
}
