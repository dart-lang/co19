// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `assigned` is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When
/// `assigned` is true, we say that the variable is definitely assigned at that
/// point.
///
/// @description Checks that an assignment in a body of `for-in` loop is
/// detected by flow analysis.
/// @author sgrekhov@unipro.ru

main() {
  var collection = [3, 1, 4, 1, 5];
  late int n;
  for (var v in collection) {
    n = 42;
  }
  n;  // Not definitely unassigned
}
