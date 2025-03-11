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
/// @description Checks that in an expression of the form `E1 && E2`, if `E1` is
/// `false` and the static type of `E2` is `Never`, then the code after
/// `E1 && E2` is not considered dead code.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

main() {
  late int i;
  if (2 > 1) {
    false && foo();
    i = 42;
  }
  i; // Not definitely unassigned
}
