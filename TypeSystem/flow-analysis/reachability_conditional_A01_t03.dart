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
/// @description Checks that if `E` has the form `if-case` and an expression in
/// a `when` part has type `Never` then `then` branch is unreachable.
/// @author sgrekhov22@gmail.com
/// @issue 60269

Never foo() => throw "Never";

void test() {
  int i;
  if (true case == false when foo()) {
    // This branch is unreachable
  } else {
    i = 0; // Definitely assigned
  }
  i; // Not an error
}

main() {
  test();
}
