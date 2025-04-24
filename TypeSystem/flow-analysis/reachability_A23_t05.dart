// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion negated instance check If `N` is an expression of the form
/// `E1 is! S` where the static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - If `T` is a bottom type, then:
///   - Let `true(N) = after(E1)`.
///   - Let `false(N) = unreachable(after(E1))`.
/// - Otherwise:
///   - Let `true(N) = promote(E1, factor(T, S), after(E1))`
///   - Let `false(N) = promote(E1, S, after(E1))`
///
/// @description Checks that if `T is a bottom type then `true(N) = after(E1)`.
/// @author sgrekhov22@gmail.com

test(x) {
  int i;
  if (x is! Never) {
    i = 42;
  }
  i; // Definitely assigned.
}

main() {
  test(null);
}
