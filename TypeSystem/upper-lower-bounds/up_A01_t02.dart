// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// - UP(`T`, `T`) = `T`
///
/// @description Check that UP(`T`, `T`) = `T`. Test type `void`.
/// @author sgrekhov22@gmail.com

void f1(void x, void y) {
  var v = (1 > 2) ? x : y;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
void main() {
  print(f1);
}
