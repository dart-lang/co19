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
/// where `T3` = UP(`T1`, `T2`). Test `Future<void>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void f1(FutureOr<int> t1, Future<void> t2) {
  // UP(FutureOr<int>, Future<void>) = FutureOr<UP(int, void)> = FutureOr<void>
  var v = (1 > 2) ? t1 : t2;
  print(await v); // Check that type `void` cannot be used.
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
}
