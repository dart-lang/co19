// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `assigned` is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When
/// `assigned` is true, we say that the variable is definitely assigned at that
/// point.
///
/// @description Checks that if the condition of a `while` statement is the
/// `true` literal, then an assignment in the body of the loop is treated by
/// flow analysis as a definite assignment.
/// @author sgrekhov@unipro.ru

main() {
  int n;
  while (true) {
    n = 42;
    break;
  }
  n;  // It's not an error to read local non-nullable variable when it is definitely assigned
}
