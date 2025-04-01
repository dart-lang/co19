// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch statement: If `N` is a switch statement of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = before(N)`.
/// - For each `C` in `alternatives` with statement body `S`:
///   - If `C` is labelled let
///     `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
///     otherwise let `before(S) = after(E)`.
///  - If the cases are exhaustive, then let `after(N) = break(N)` otherwise let
///    `after(N) = join(after(E), break(N))`.
///
/// @description Checks that if `C` is labelled then
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if `C` is labeled and a variable was assigned in `N` then  it is in a
/// "possibly assigned" state in `after(N)`.
/// @author sgrekhov22@gmail.com

test() {
  late int i;
  switch (42) {
    label: case 1:
      break;
      i = 42;
    default:
  }
  i; // Possibly assigned
}

main() {
  print(test);
}
