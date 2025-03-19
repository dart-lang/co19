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
/// @description Checks that `before(U) = merge(after(S), continue(S))`. Test
/// that if `D`, `C` are empty and variable is assigned in `S` after `continue`,
/// then this variable is treated in `U` as 'possibly assigned`.
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  try {
    for (;; i) { // Possibly assigned. https://github.com/dart-lang/sdk/issues/42232#issuecomment-690681385
      continue;
      i = 42;
    }
  } catch (_) {}
}
