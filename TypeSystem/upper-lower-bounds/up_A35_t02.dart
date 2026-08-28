// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`Future<T1>`, `FutureOr<T2>`) = `FutureOr<T3>` where `T3` = UP(`T1`,
///   `T2`)
///
/// @description Check that UP(`Future<T1>`, `FutureOr<T2>`) = `FutureOr<T3>`
/// where `T3` = UP(`T1`, `T2`). Test `Future<void>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void f1(Future<void> t1, FutureOr<num> t2) async {
  // UP(Future<void>, FutureOr<num>) = FutureOr<UP(void, num)> = FutureOr<void>
  var v = (1 > 2) ? t1 : t2;
  print(await v); // Check that type `void` cannot be used.
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
}
