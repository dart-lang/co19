// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `assigned` is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When
/// `assigned` is true, we say that the variable is definitely assigned at that
/// point.
///
/// @description Checks definite assignment via record pattern assignment.
/// @author sgrekhov22@gmail.com

main() {
  int i, j;

  (i,) = (42,);
  i;  // Definitely assigned
  (x: j) = (x: 42);
  j;
}
