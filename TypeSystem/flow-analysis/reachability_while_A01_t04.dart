// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion while statement: If `N` is a while statement of the form
/// `while (E) S` then:
/// - Let `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(E))`.
/// - Let `after(N) = inheritTested(join(false(E), unsplit(break(S))), after(S))`
///
/// @description Checks that
/// `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// Test if there is an assignment in `S` (even after the `return` statement)
/// then `after(N)` the variable is "possibly assigned".
/// @author sgrekhov22@gmail.com

test() {
  late int i;
  if (1 > 2) {
    while (2 > 1) {
      return;
      i = 42;
    }
    i; // Possibly assigned. See https://github.com/dart-lang/sdk/issues/42232#issuecomment-690681385
  }
  i;
}

main() {
  print(test);
}
