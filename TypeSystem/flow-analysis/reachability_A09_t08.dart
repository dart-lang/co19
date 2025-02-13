// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that an expression of the form `E1 != E2` is treated as
/// equivalent to the expression `!(E1 == E2)`. Test `stripParens(E2)` is a
/// `null` literal case.
/// @author sgrekhov22@gmail.com

test(int? n) {
  if (n != (null)) {
    n.isEven;
  }
}

main() {
  test(1);
  test(null);
}
