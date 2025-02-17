// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that an expression of the form `E1 != E2` is treated as
/// equivalent to the expression `!(E1 == E2)`. Test `equivalentToNull(T1)` and
/// `equivalentToNull(T2) case.
/// @author sgrekhov@unipro.ru
/// @issue 41981

main() {
  late int i;
  int j;
  Null n1 = null;
  Null n2 = null;
  if (n1 != n2) {
    i = 42; // Variable is initialized in a dead code. This leaves it definitely unassigned
  } else {
    j = 42;
  }
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
  j; // Definitely assigned
}
