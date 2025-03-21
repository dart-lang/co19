// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `assigned` is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When
/// `assigned` is true, we say that the variable is definitely assigned at that
/// point.
///
/// @description Checks that if the condition of a `while` statement is the
/// `false` literal, then an assignment in the body of the loop is treated by
/// flow analysis as `possible assigned`.
/// @author sgrekhov@unipro.ru
/// @issue 60322

main() {
  late int n;
  while (false) {
    n = 42;
  }
  n;  // Possibly assigned. See https://github.com/dart-lang/sdk/issues/60322
}
