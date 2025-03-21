// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that `after(N) = join(false(E), break(S))`. Test that if
/// `E` is a `true` literal but `S` has a `break` statement then `after(N)` is
/// not unreachable.
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  if (2 > 1) {
    do {
      if (2 > 1) {
        break;
      }
    } while (true);
    i = 42;
  }
  i; // Not definitely unassigned
}
