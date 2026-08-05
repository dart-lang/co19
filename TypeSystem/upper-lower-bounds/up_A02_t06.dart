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
/// @description Check that UP(`T1`, `T2`) = `T2` if `T1 != T2` and TOP(`T1`)
/// and TOP(`T2`) and MORETOP(`T1`, `T2`) == false. Test that `dynamic` is more
/// top than `Object?`
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

void f1(Object? x, dynamic y) {
  var v = (1 > 2) ? x : y; // MORETOP(Object?, dynamic) = false
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f2(Object? x, FutureOr<dynamic> y) async {
  var v = (1 > 2) ? x : y; // MORETOP(Object?, FutureOr<dynamic>) = false
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void f3(FutureOr<Object?> x, dynamic y) {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<Object?>, dynamic) = false
  if (1 > 2) {
    v.checkDynamic;
  }
}

void f4(FutureOr<Object?> x, FutureOr<dynamic> y) async {
  var v = (1 > 2) ? x : y; // MORETOP(FutureOr<Object?>, FutureOr<dynamic>) = false
  v.expectStaticType<Exactly<FutureOr<dynamic>>>();
  if (1 > 2) {
    (await v).checkDynamic;
  }
}

void main() {
  f1(1, 2);
  f2(1, 2);
  f3(1, 2);
  f4(1, 2);
}
