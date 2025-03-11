// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Shortcut or: If `N` is a shortcut "or" expression of the form
/// `E1 || E2`, then:
/// - Let `before(E1) = before(N)`.
/// - Let `before(E2) = split(false(E1))`.
/// - Let `false(N) = unsplit(false(E2))`.
/// - Let `true(N) = merge(split(true(E1)), true(E2))`.
///
/// @description Checks that in an expression of the form `E1 || E2` if `E1` is
/// `true` then `E2` is never executed.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

main() {
  late int i;
  if (2 > 1) {
    true || foo();
    i = 42;
  }
  i; // Not definitely unassigned
}
