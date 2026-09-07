// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`FutureOr<T1>`, `Future<T2>`) = `FutureOr<T3>` where `T3` = UP(`T1`,
///   `T2`)
///
/// @description Check that UP(`FutureOr<T1>`, `Future<T2>`) = `FutureOr<T3>`
/// where `T3` = UP(`T1`, `T2`), when further:
/// `FutureOr<T1> != FutureOr<T2>` and neither `FutureOr<T1>` nor `FutureOr<T2>`
/// is TOP or OBJECT. Note that `FutureOr<...>` is never BOTTOM, NULL, an
/// intersection type, a type of the form `U?`, a type variable, `Function`, a
/// function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com
/// @issue 64205

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(FutureOr<int> t1, Future<Object?> t2) {
  // FutureOr<UP(int, Object?)> = FutureOr<Object?>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object?>>();
  (await v).checkNotDynamic;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // Check that the type of `v` is not `Object?`
  var x = nonNull(v);
  Object _ = x;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
}
