// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Shortcut and: If `N` is a shortcut "and" expression of the form
/// `E1 && E2`, then:
/// - Let `before(E1) = before(N)`.
/// - Let `before(E2) = split(true(E1))`.
/// - Let `true(N) = unsplit(true(E2))`.
/// - Let `false(N) = merge(split(false(E1)), false(E2))`.
///
/// @description Checks that in an expression of the form `E1 && E2` `E1` is
/// always executed.
/// @author sgrekhov22@gmail.com

main() {
  int i;
  (i = 42) != 42 && false;
  i; // Definitely assigned
}
