// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that `after(N) = join(before(S), break(S))`. Test that
/// an assignment in `S` before the `break` statement is treated by flow
/// analysis as possibly assigned.
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  if (2 > 1) {
    for (var j in [42]) {
      i = 42;
      break;
    }
  }
  i; // Possibly assigned.
}
