// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T2` if BOTTOM(`T1`)
///
/// @description Check that UP(`T1`, `T2`) = `T2` if BOTTOM(`T1`) and the
/// earlier conditions listed in README.md are not met. Test type `void` as `T2`
/// @author sgrekhov22@gmail.com

void f1(Never n1, void n2) {
  var v = (1 > 2) ? n1 : n2;
  print(v); // Type `void` cannot be used
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2<X extends Never>(X n1, void n2) {
  var v = (1 > 2) ? n1 : n2;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
void main() {
  print(f1);
  print(f2);
}
