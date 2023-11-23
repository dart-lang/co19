// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion assigned is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When assigned
/// is true, we say that the variable is definitely assigned at that point.
///
/// @description Checks definite assignment and for-in loop
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong

main() {
  var collection = [3, 1, 4, 1, 5];
  int n;
  for (var v in [n = 42]) {
  }
  n;  // It's not an error to read local non-nullable variable when it is definitely assigned
}
