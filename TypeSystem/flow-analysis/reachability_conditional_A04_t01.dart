// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Conditional statement: If `N` is a conditional statement of the
/// form `if (E) S1 else S2` then:
/// - Let `before(E) = before(N)`.
/// - Let `before(S1) = split(true(E))`.
/// - Let `before(S2) = split(false(E))`.
/// - Let `after(N) = merge(after(S1), after(S2))`.
///
/// @description Checks that `before(S1) = split(true(E))` and
/// `before(S2) = split(false(E))`.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

main() {
  int i;
  if (2 > 1) {
    i = 42;
  } else {
    foo();
  }
  i; // Definitely assigned
}
