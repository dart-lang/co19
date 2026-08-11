// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) where BOTTOM(`T1`) and BOTTOM(`T2`) =
///   - `T2` if MOREBOTTOM(`T1`, `T2`)
///   - `T1` otherwise
///
/// @description Check that UP(`T1`, `T2`) = `T2` if BOTTOM(`T1`) and
/// BOTTOM(`T2`) and MOREBOTTOM(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

// ignore_for_file: dead_code, unused_local_variable

void f1<X extends Never>(Never n1, X n2) {
  var v = (1 > 2) ? n1 : n2; // MOREBOTTOM(Never, X) = true
  // It's not possible to check that `v` is `X` rather than `Never`. We just
  // check that it is subtype of `Never` (i.e., it is assignable to both
  // `String` and `int` and is not `dynamic`).
  int i = v;
  String s = v;
  var v2 = (1 > 2) ? v : 42 as Object?;
  v2.proofNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
}
