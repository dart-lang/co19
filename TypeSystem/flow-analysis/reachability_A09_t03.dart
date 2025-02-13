// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that an expression of the form `E1 != E2` is treated as
/// equivalent to the expression `!(E1 == E2)`. Test `equivalentToNull(T1)` and
/// `equivalentToNull(T2) case.
/// @author sgrekhov22@gmail.com

test1<T extends Null>(T t) {
  late int i;
  Null n = null;
  if (n != t) {
    i = 42; // Variable is initialized in a dead code. This leaves it definitely unassigned
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2<T extends Null>(T t) {
  late int i;
  Null n = null;
  if (t != n) {
    i = 42; // Variable is initialized in a dead code. This leaves it definitely unassigned
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
