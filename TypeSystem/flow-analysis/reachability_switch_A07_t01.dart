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
/// @description Checks that if a variable is initialized in a `case` statement
/// with a variable pattern of the type which is not subtype of the type of the
/// checked value then this variable is possibly assigned.
/// @author sgrekhov22@gmail.com
/// @issue 60677

void test1() {
  late int i;
  switch (42) {
    case String _:
      i = 42;
    default:
  }
  i; // Possibly assigned, see https://github.com/dart-lang/sdk/issues/60677
}

void test2() {
  late int i;
  switch (42) {
    label: case String _:
      i = 42;
    default:
  }
  i; // Possibly assigned
}

main() {
  print(test1);
  print(test2);
}
