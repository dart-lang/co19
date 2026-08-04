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
/// MORETOP(`T1`, `T2`). Test that `void` is more top type than others.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}

void f1(dynamic y) {
  var v = (1 > 2) ? getVoid() : y; // MORETOP(void, dynamic) = true
  print(v); // Type void cannot be used
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2(Object? y) {
  var v = (1 > 2) ? getVoid() : y; // MORETOP(void, Object?) = true
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3(FutureOr<dynamic> y) {
  var v = (1 > 2) ? getVoid() : y; // MORETOP(void, FutureOr<dynamic>) = true
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4(FutureOr<Object?> y) {
  var v = (1 > 2) ? getVoid() : y; // MORETOP(void, FutureOr<Object?>) = true
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5(FutureOr<void> y) {
  var v = (1 > 2) ? getVoid() : y; // MORETOP(void, FutureOr<void>) = true
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
}
