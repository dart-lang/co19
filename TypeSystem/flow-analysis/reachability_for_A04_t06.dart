// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for statement: If `N` is a for statement of the form
/// `for (D; C; U) S,` then:
/// - Let `before(D) = before(N)`.
/// - Let `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(C))`.
/// - Let `before(U) = merge(after(S), continue(S))`.
/// - Let `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`
///
/// @description Checks that
/// `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`.
/// Test that if `U` may throw then `after(N)` is not unreachable.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

main() {
  late int i;
  if (2 > 1) {
    for (;;foo()) {
      if (2 > 1) {
        break;
      }
    }
    i = 42;
  }
  i; // Not definitely unassigned.
}
