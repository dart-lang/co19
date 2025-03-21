// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that if a variable is assigned in `S` then it is not
/// definitely unassigned in `S`.
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  do {
    if (1 > 2) {
      i; // Not definitely unassigned
    };
    i = 42;
  } while (false);
}
