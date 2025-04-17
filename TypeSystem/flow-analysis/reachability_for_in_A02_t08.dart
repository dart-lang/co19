// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if there is an assignment in `S` (even after the `return` statement)
/// then in `after(N)` the variable is "possibly assigned".
/// @author sgrekhov22@gmail.com

test() {
  late int i;
  if (2 > 1) {
    for (var j in []) {
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
